import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

class EditProfileScreenMobile extends StatefulWidget {
  const EditProfileScreenMobile({super.key});

  @override
  State<EditProfileScreenMobile> createState() =>
      _EditProfileScreenMobileState();
}

class _EditProfileScreenMobileState extends State<EditProfileScreenMobile> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w20),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h10),
            Stack(
              children: [
                Container(
                  width: AppSizes.sp100,
                  height: AppSizes.sp100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryGreen, width: 1),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImagesStrings.user,
                      width: AppSizes.sp40,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: AppSizes.sp30,
                    height: AppSizes.sp30,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: AppSizes.sp16,
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpace(height: AppHeight.h30),
            CustomInputField(
              controller: _fullNameController,
              hintText: AppTextStrings.fullName,
              heigh: AppHeight.h53,
            ),
            VerticalSpace(height: AppHeight.h16),
            CustomPhoneNumber(),
            VerticalSpace(height: AppHeight.h16),
            CustomInputField(
              controller: _passwordController,
              hintText: AppTextStrings.password,
              heigh: AppHeight.h53,
              isPassword: true,
            ),
            VerticalSpace(height: AppHeight.h40),
            PrimaryButton(label: AppTextStrings.submit, onPressed: () {}),
            VerticalSpace(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
