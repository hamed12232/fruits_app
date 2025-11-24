import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/text_field/custom_phone_number_field.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

class EditProfileScreenDesktop extends StatefulWidget {
  const EditProfileScreenDesktop({super.key});

  @override
  State<EditProfileScreenDesktop> createState() =>
      _EditProfileScreenDesktopState();
}

class _EditProfileScreenDesktopState extends State<EditProfileScreenDesktop> {
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
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(48),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryGreen,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImagesStrings.user,
                          width: 50,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
                VerticalSpace(height: 40),
                CustomInputField(
                  controller: _fullNameController,
                  hintText: AppTextStrings.fullName,
                  heigh: 56,
                ),
                VerticalSpace(height: 24),
                CustomPhoneNumber(),
                VerticalSpace(height: 24),
                CustomInputField(
                  controller: _passwordController,
                  hintText: AppTextStrings.password,
                  heigh: 56,
                  isPassword: true,
                ),
                VerticalSpace(height: 48),
                PrimaryButton(label: AppTextStrings.submit, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
