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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
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
                AppTextStrings.signUpToWikala,
                style: textTheme.displayLarge,
              ),
              VerticalSpace(height: AppHeight.h30),
              CustomAttributeWithTextField(
                fullNameController: fullNameController,
                attributeName: AppTextStrings.fullName,
                hintText: AppTextStrings.firstAndLastName,
              ),
              VerticalSpace(height: AppHeight.h33),
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: AppTextStrings.phoneNumberWithWhatsapp,
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
              VerticalSpace(height: AppHeight.h41),
              PrimaryButton(
                label: AppTextStrings.signUp,
                onPressed: () {},
                height: AppHeight.h52,
                width: double.infinity,
              ),
              VerticalSpace(height: AppHeight.h41),
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
    );
  }
}
