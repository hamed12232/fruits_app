import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/services/one_signal_services.dart';
import 'package:fruits_app/core/utils/Di/service_locator.dart';
import 'package:fruits_app/core/utils/routes/app_route.dart';
import 'package:fruits_app/core/utils/theme/app_theme.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await NotificationService.initializeNotification();
  await OneSignalService.init();
  // String? token = await NotificationService.getFCMToken();
  // log('FCM Token: ${token ?? "Not available"}');

  // Initialize dependency injection
  await initServiceLocator();

  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (_) => sl<CartCubit>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            onGenerateRoute: AppRouteManager.onGenerateRoute,
            home: child,
          ),
        );
      },
    );
  }
}
