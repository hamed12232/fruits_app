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

class WelcomeScreenLandscape extends StatelessWidget {
  const WelcomeScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
          
            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w24,
                    vertical: AppHeight.h20,
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
                      Text(
                        AppTextStrings.welcomeToOurApp,
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: AppSizes.sp20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      VerticalSpace(height: AppHeight.h40),
                      _buildButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w66),
      child: Column(
        children: [
          AuthButton(
            label: AppTextStrings.signInWithPhoneNumber,
            isIcon: true,
            icon: Icons.phone,
            onPressed: () {
              Navigator.of(context).pushNamed(VerifyNumberScreen.routeName);
            },
            fontSize: AppSizes.sp12,
          ),
          VerticalSpace(height: AppHeight.h20),
          AuthButton(
            label: AppTextStrings.signInWithGoogle,
            image: AppImagesStrings.googleImage,
            onPressed: () {},
            fontSize: AppSizes.sp12,
          ),
      
          VerticalSpace(height: AppHeight.h20),
          AuthButton(
            label: AppTextStrings.signInWithFacebook,
            image: AppImagesStrings.facebookImage,
            onPressed: () {},
            filledColor: AppColors.blue,
            foregroundColor: Colors.white,
            fontSize: AppSizes.sp12,
          ),
      
          VerticalSpace(height: AppHeight.h40),
      
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppTextStrings.alreadyMember,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: AppSizes.sp12),
                  ),
                  TextSpan(
                    text: AppTextStrings.signIn,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkBlue,
                      decoration: TextDecoration.underline,
                      fontSize: AppSizes.sp12,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(SignInScreen.routeName);
                      },
                  ),
                ],
              ),
            ),
          ),
          VerticalSpace(height: AppHeight.h20),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppTextStrings.byContinueYouAgreeToOur,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey10,
                      fontSize: AppSizes.sp12,
                    ),
                  ),
      
                  TextSpan(
                    text: AppTextStrings.termsOfService,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkBlue,
                      fontSize: AppSizes.sp12,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: AppTextStrings.andOur,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey10,
                      fontSize: AppSizes.sp12,
                    ),
                  ),
      
                  TextSpan(
                    text: AppTextStrings.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkBlue,
                      fontSize: AppSizes.sp12,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
