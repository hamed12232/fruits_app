import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/Di/service_locator.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/cubit/login_cubit.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/cubit/login_state.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_desktop.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_landscape.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_mobile.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_tablet.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen_web.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class SignInScreenAdaptive extends StatelessWidget {
  const SignInScreenAdaptive({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainNavigationScreen.routeName,
                (route) => false,
              );
            } else if (state is LoginError) {
              // Show error snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return AdaptiveLayout(
              mobileLayout: OrientationBuilder(
                builder: (context, orientation) =>
                    orientation == Orientation.landscape
                    ? const SignInScreenLandscape()
                    : const SignInScreenMobile(),
              ),
              tabletLayout: OrientationBuilder(
                builder: (context, orientation) =>
                    orientation == Orientation.landscape
                    ? const SignInScreenLandscape()
                    : const SignInScreenTablet(),
              ),
              desktopLayout: kIsWeb
                  ? const SignInScreenWeb()
                  : const SignInScreenDesktop(),
            );
          },
        ),
      ),
    );
  }
}
