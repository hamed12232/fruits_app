import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

class ContactUsScreenDesktop extends StatelessWidget {
  const ContactUsScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppTextStrings.contactUs),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 700),
          padding: EdgeInsets.all(48),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Get in Touch',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryGreen,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VerticalSpace(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppTextStrings.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.titleOfTextField,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                VerticalSpace(height: 12),
                CustomInputField(hintText: '', heigh: 56),
                VerticalSpace(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppTextStrings.mobileNumber,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.titleOfTextField,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                VerticalSpace(height: 12),
                const CustomPhoneNumber(),
                VerticalSpace(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppTextStrings.message,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.titleOfTextField,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                VerticalSpace(height: 12),
                CustomInputField(hintText: '', heigh: 160, maxLines: 5),
                VerticalSpace(height: 32),
                PrimaryButton(label: AppTextStrings.submit, onPressed: () {}),
                VerticalSpace(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImagesStrings.facebookImage,
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(width: 24),
                    Image.asset(
                      AppImagesStrings.instagram,
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(width: 24),
                    Image.asset(
                      AppImagesStrings.youtube,
                      width: 48,
                      height: 48,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
