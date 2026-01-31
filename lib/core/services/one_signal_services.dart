import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static Future<void> init() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.error);
    OneSignal.initialize("d001f9ce-2e1c-426d-bd20-f9e97c92cb06");
    OneSignal.Notifications.requestPermission(true);
  }
}
