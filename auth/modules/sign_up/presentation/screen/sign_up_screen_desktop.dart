import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_attribute_with_text_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';

class SignUpScreenDesktop extends StatefulWidget {
  const SignUpScreenDesktop({super.key});

  @override
  State<SignUpScreenDesktop> createState() => _SignUpScreenDesktopState();
}

class _SignUpScreenDesktopState extends State<SignUpScreenDesktop> {
  final TextEditingController fullNameController = TextEditingController();
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
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(48.0),
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
                        AppTextStrings.signUpToWikala,
                        style: textTheme.displayLarge?.copyWith(fontSize: 32),
                      ),
                      const SizedBox(height: 40),
                      CustomAttributeWithTextField(
                        fullNameController: fullNameController,
                        attributeName: AppTextStrings.fullName,
                        hintText: AppTextStrings.firstAndLastName,
                      ),
                      const SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          text: AppTextStrings.phoneNumberWithWhatsapp,
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
                      const SizedBox(height: 32),
                      PrimaryButton(
                        label: AppTextStrings.signUp,
                        onPressed: () {},
                        height: 52.0,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppTextStrings.alreadyHaveAnAccount,
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
                                    Navigator.of(context).pop();
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
            ],
          ),
        ),
      ),
    );
  }
}
