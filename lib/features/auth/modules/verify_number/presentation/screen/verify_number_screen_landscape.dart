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

class VerifyNumberScreenLandscape extends StatelessWidget {
  const VerifyNumberScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          children: [
            // Left side - Branding
        
            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w32,
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
                        AppTextStrings.enterYourNumber,
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
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w32),
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
        CustomPhoneNumber(fontSize: AppSizes.sp10, iconSize: AppSizes.sp10),
        VerticalSpace(height: AppHeight.h20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w56),
          child: PrimaryButton(
            label: AppTextStrings.submit,
            onPressed: () {
              Navigator.of(context).pushNamed(OtpVerificationScreen.routeName);
            },
            width: double.infinity,
            fontSize: AppSizes.sp12,
          ),
        ),
      ],
    ),
    );
  }
}
