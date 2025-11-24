import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/adaptive_layout/simple_adaptive_screen.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_attribute_with_text_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class SignInScreenTablet extends StatefulWidget {
  const SignInScreenTablet({super.key});

  @override
  State<SignInScreenTablet> createState() => _SignInScreenTabletState();
}

class _SignInScreenTabletState extends State<SignInScreenTablet> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SimpleAdaptiveScreen(
        maxWidth: 500,
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppWidth.w42,
                vertical: AppHeight.h47,
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
                    AppTextStrings.loginToWikala,
                    style: textTheme.displayLarge,
                  ),
                  VerticalSpace(height: AppHeight.h30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      TextSpan(
                        text: AppTextStrings.phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.sp14,
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
                  CustomPhoneNumber(),

                  CustomAttributeWithTextField(
                    fullNameController: passwordController,
                    attributeName: AppTextStrings.password,
                    hintText: AppTextStrings.password,
                  ),
                  VerticalSpace(height: AppHeight.h21),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          VerifyNumberScreen.routeName,
                        );
                      },
                      child: Text(
                        AppTextStrings.forgotPassword,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.darkBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  VerticalSpace(height: AppHeight.h21),
                  PrimaryButton(
                    label: AppTextStrings.login,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        MainNavigationScreen.routeName,
                      );
                    },
                    height: AppHeight.h52,
                    width: double.infinity,
                  ),
                  VerticalSpace(height: AppHeight.h41),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppTextStrings.dontHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: AppTextStrings.signUp,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.darkBlue,
                                  decoration: TextDecoration.underline,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(
                                  context,
                                ).pushNamed(SignUpScreen.routeName);
                              },
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
