import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_attribute_with_text_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class SignInScreenDesktop extends StatefulWidget {
  const SignInScreenDesktop({super.key});

  @override
  State<SignInScreenDesktop> createState() => _SignInScreenDesktopState();
}

class _SignInScreenDesktopState extends State<SignInScreenDesktop> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              // Left side - Branding/Image
              Expanded(
                flex: 5,
                child: Container(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppTextStrings.fruitMarket,
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppColors.primaryGreen,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Icon(
                        Icons.shopping_basket,
                        size: 120,
                        color: AppColors.primaryGreen,
                      ),
                    ],
                  ),
                ),
              ),
              // Right side - Form
              Expanded(
                flex: 5,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 48.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.black,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            AppTextStrings.loginToWikala,
                            style: textTheme.displayLarge?.copyWith(
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text.rich(
                            TextSpan(
                              text: AppTextStrings.phoneNumber,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize: 14.0,
                                    color: AppColors.titleOfTextField,
                                  ),
                              children: const [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const CustomPhoneNumber(),
                          const SizedBox(height: 24),
                          CustomAttributeWithTextField(
                            fullNameController: passwordController,
                            attributeName: AppTextStrings.password,
                            hintText: AppTextStrings.password,
                          ),
                          const SizedBox(height: 16),
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
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: AppColors.darkBlue,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          PrimaryButton(
                            label: AppTextStrings.login,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                MainNavigationScreen.routeName,
                              );
                            },
                            height: 52.0,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppTextStrings.dontHaveAnAccount,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  TextSpan(
                                    text: AppTextStrings.signUp,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
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
            ],
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
