import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/widget/auth_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static final String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w24,
              vertical: AppHeight.h47,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: AppColors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                VerticalSpace(height: AppHeight.h62),
                Text(
                  AppTextStrings.fruitMarket,
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.primaryGreen,
                    fontSize: AppSizes.sp42,
                  ),
                ),
                VerticalSpace(height: AppHeight.h21),
                Text(
                  AppTextStrings.welcomeToOurApp,
                  style: textTheme.displayLarge,
                ),
                VerticalSpace(height: AppHeight.h52),
      
                AuthButton(
                  label: AppTextStrings.signInWithPhoneNumber,
                  isIcon: true,
                  icon: Icons.phone,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(VerifyNumberScreen.routeName);
                  },
                ),
                VerticalSpace(height: AppHeight.h21),
                AuthButton(
                  label: AppTextStrings.signInWithGoogle,
                  image: AppImagesStrings.googleImage,
                  onPressed: () {},
                ),
      
                VerticalSpace(height: AppHeight.h21),
                AuthButton(
                  label: AppTextStrings.signInWithFacebook,
                  image: AppImagesStrings.facebookImage,
                  onPressed: () {},
                  filledColor: AppColors.blue,
                  foregroundColor: Colors.white,
                ),
      
                VerticalSpace(height: AppHeight.h79),
      
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppTextStrings.alreadyMember,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: AppTextStrings.signIn,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.darkBlue,
                                decoration: TextDecoration.underline,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(
                                context,
                              ).pushNamed(SignInScreen.routeName);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSpace(height: AppHeight.h58),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppTextStrings.byContinueYouAgreeToOur,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.grey10),
                        ),
      
                        TextSpan(
                          text: AppTextStrings.termsOfService,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.darkBlue),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: AppTextStrings.andOur,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.grey10),
                        ),
      
                        TextSpan(
                          text: AppTextStrings.privacyPolicy,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.darkBlue),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
