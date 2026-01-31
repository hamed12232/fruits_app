import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/Di/service_locator.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_cubit.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_state.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_desktop.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_landscape.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_mobile.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_tablet.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen_web.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class SignUpScreenAdaptive extends StatelessWidget {
  const SignUpScreenAdaptive({super.key});
  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Register successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainNavigationScreen.routeName,
                (route) => false,
              );
            } else if (state is RegisterError) {
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
                    ? const SignUpScreenLandscape()
                    : const SignUpScreenMobile(),
              ),
              tabletLayout: OrientationBuilder(
                builder: (context, orientation) =>
                    orientation == Orientation.landscape
                    ? const SignUpScreenLandscape()
                    : const SignUpScreenTablet(),
              ),
              desktopLayout: kIsWeb
                  ? const SignUpScreenWeb()
                  : const SignUpScreenDesktop(),
            );
          },
        ),
      ),
    );
  }
}
