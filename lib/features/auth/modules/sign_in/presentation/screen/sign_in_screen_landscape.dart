import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_attribute_with_text_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class SignInScreenLandscape extends StatefulWidget {
  const SignInScreenLandscape({super.key});

  @override
  State<SignInScreenLandscape> createState() => _SignInScreenLandscapeState();
}

class _SignInScreenLandscapeState extends State<SignInScreenLandscape> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.black,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Text(
                        AppTextStrings.loginToWikala,
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: AppSizes.sp20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      VerticalSpace(height: AppHeight.h40),
                      _buildForm(context),
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

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w56),
      child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text.rich(
            TextSpan(
              text: AppTextStrings.phoneNumber,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: AppSizes.sp10,
                color: AppColors.titleOfTextField,
              ),
              children: [
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        VerticalSpace(height: AppHeight.h7),
        CustomPhoneNumber(fontSize: AppSizes.sp10, iconSize: AppSizes.sp24),

        CustomAttributeWithTextField(
          fullNameController: passwordController,
          attributeName: AppTextStrings.password,
          hintText: AppTextStrings.password,
          fontSize: AppSizes.sp10,
        ),
        VerticalSpace(height: AppHeight.h20),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, VerifyNumberScreen.routeName);
            },
            child: Text(
              AppTextStrings.forgotPassword,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.darkBlue,
                fontSize: AppSizes.sp12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        VerticalSpace(height: AppHeight.h30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w48),
          child: PrimaryButton(
            label: AppTextStrings.login,
            onPressed: () {
              Navigator.pushNamed(context, MainNavigationScreen.routeName);
            },
            width: double.infinity,
            fontSize: AppSizes.sp12,
          ),
        ),
        VerticalSpace(height: AppHeight.h30),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppTextStrings.dontHaveAnAccount,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: AppSizes.sp12),
                ),
                TextSpan(
                  text: AppTextStrings.signUp,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkBlue,
                    decoration: TextDecoration.underline,
                    fontSize: AppSizes.sp12,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
