import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({super.key});
  static const routeName = '/verify-number';

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
                AppTextStrings.enterYourNumber,
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
              VerticalSpace(height: AppHeight.h41),
              PrimaryButton(
                label: AppTextStrings.submit,
                onPressed: () {
                  Navigator.of(context).pushNamed(OtpVerificationScreen.routeName);
                },
                height: AppHeight.h52,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
