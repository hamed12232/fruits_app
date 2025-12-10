import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

class EditProfileScreenLandscape extends StatefulWidget {
  const EditProfileScreenLandscape({super.key});

  @override
  State<EditProfileScreenLandscape> createState() =>
      _EditProfileScreenLandscapeState();
}

class _EditProfileScreenLandscapeState
    extends State<EditProfileScreenLandscape> {
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
        padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w100,
        ), // Increased horizontal padding for landscape
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h10),
            Stack(
              children: [
                Container(
                  width: 80.sp, // Reduced size
                  height: 80.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryGreen, width: 1),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: AppSizes.sp30, // Reduced size
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: 12.sp),
                  ),
                ),
              ],
            ),
            VerticalSpace(height: AppHeight.h20),
            CustomInputField(
              controller: _fullNameController,
              hintText: AppTextStrings.fullName,
              heigh: 45.h, // Reduced height
              fontSize: 10.sp, // Smaller font size
            ),
            VerticalSpace(height: AppHeight.h16),
            CustomPhoneNumber(
              fontSize: 10.sp, // Smaller font size
              iconSize: 20.sp,
            ),
            VerticalSpace(height: AppHeight.h16),
            CustomInputField(
              controller: _passwordController,
              hintText: AppTextStrings.password,
              heigh: 45.h, // Reduced height
              isPassword: true,
              fontSize: 10.sp, // Smaller font size
            ),
            VerticalSpace(height: AppHeight.h30),
            SizedBox(
              height: 40.h,
              child: PrimaryButton(
                label: AppTextStrings.submit,
                onPressed: () {},
                fontSize: 12.sp,
              ),
            ),
            VerticalSpace(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
