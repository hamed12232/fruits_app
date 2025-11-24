import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

class ContactUsScreenMobile extends StatelessWidget {
  const ContactUsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppTextStrings.contactUs),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w42),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppTextStrings.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.titleOfTextField,
                  fontSize: AppSizes.sp14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CustomInputField(hintText: '', heigh: AppHeight.h53),
            VerticalSpace(height: AppHeight.h20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppTextStrings.mobileNumber,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.titleOfTextField,
                  fontSize: AppSizes.sp14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            const CustomPhoneNumber(),
            VerticalSpace(height: AppHeight.h20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppTextStrings.message,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.titleOfTextField,
                  fontSize: AppSizes.sp14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CustomInputField(hintText: '', heigh: AppHeight.h140, maxLines: 5),
            VerticalSpace(height: AppHeight.h30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImagesStrings.facebookImage,
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: AppWidth.w16),
                Image.asset(AppImagesStrings.instagram, width: 40, height: 40),
                SizedBox(width: AppWidth.w16),
                Image.asset(AppImagesStrings.youtube, width: 40, height: 40),
              ],
            ),
            VerticalSpace(height: AppHeight.h30),
            PrimaryButton(label: AppTextStrings.submit, onPressed: () {}),
            VerticalSpace(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
