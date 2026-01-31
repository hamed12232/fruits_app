import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/firebase_options.dart';

// Top-level function to handle background messages
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  debugPrint('Handling background message: ${message.messageId}');
  if (message.notification != null) {
    debugPrint(
      'FCM notification payload present - skipping custom notification',
    );
    return;
  }

  // Initialize Awesome Notifications for data-only messages
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'high_importance_channel',
      channelName: 'Basic Notifications',
      channelDescription: 'Notification channel for basic alerts',
      importance: NotificationImportance.High,
      playSound: true,
      criticalAlerts: true,
      groupAlertBehavior: GroupAlertBehavior.All,
      defaultPrivacy: NotificationPrivacy.Public,
      enableVibration: true,
      enableLights: true,
    ),
  ]);

  // Handle data-only messages
  String? title = message.data['title'];
  String? body = message.data['body'];

  if (title != null || body != null) {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'high_importance_channel',
        title: title ?? "Fruits App",
        body: body ?? "New message received",
        payload: message.data.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
        wakeUpScreen: true,
        fullScreenIntent: true,
        criticalAlert: true,
        displayOnForeground: true,
        displayOnBackground: true,
        category: NotificationCategory.Message,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }
}

class NotificationService {
  static FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;

  static Future<void> initializeNotification() async {
    // 1. Initialize Awesome Notifications
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'high_importance_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic alerts',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.Max,
        playSound: true,
        criticalAlerts: true,
        groupAlertBehavior: GroupAlertBehavior.All,
        defaultPrivacy: NotificationPrivacy.Public,
        enableVibration: true,
        enableLights: true,
      ),
    ]);

    // 2. Request permissions
    await AwesomeNotifications().isNotificationAllowed().then((
      isAllowed,
    ) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    // 3. Set listeners
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
    );

    // 4. Initialize FCM
    await _initializeFCM();
  }

  static Future<void> _initializeFCM() async {
    if (Firebase.apps.isEmpty) return;

    // Request permission
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String? title = message.notification?.title ?? message.data['title'];
      String? body = message.notification?.body ?? message.data['body'];

      if (title != null || body != null) {
        showNotification(
          title: title ?? "Fruits App",
          body: body ?? "New message received",
          payload: message.data.map(
            (key, value) => MapEntry(key, value.toString()),
          ),
        );
      }
    });

    // Listen for background message taps
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Notification tapped: ${message.messageId}');
    });
  }

  static Future<String?> getFCMToken() async {
    if (Firebase.apps.isEmpty) return null;
    try {
      return await _firebaseMessaging.getToken();
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
      return null;
    }
  }

  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    debugPrint('Notification action: ${receivedAction.buttonKeyPressed}');
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    Map<String, String>? payload,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        payload: payload,
        wakeUpScreen: true,
        fullScreenIntent: true,
        criticalAlert: true,
        displayOnForeground: true,
        displayOnBackground: true,
        category: NotificationCategory.Message,
      ),
    );
  }
}
