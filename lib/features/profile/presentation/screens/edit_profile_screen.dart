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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const String routeName = '/edit-profile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primaryGreen,
                      size: AppSizes.sp20,
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpace(height: AppHeight.h16),
            Text(
              AppTextStrings.welcomeUser,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.black,
                fontSize: AppSizes.sp18,
                fontWeight: FontWeight.w500,
              ),
            ),
            VerticalSpace(height: AppHeight.h30),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: AppTextStrings.fullName,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.titleOfTextField,
                    fontSize: AppSizes.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColors.red),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CustomInputField(
              hintText: AppTextStrings.firstAndLastName,
              controller: _fullNameController,
              heigh: AppHeight.h53,
            ),
            VerticalSpace(height: AppHeight.h20),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: AppTextStrings.phoneNumberWithWhatsapp,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.titleOfTextField,
                    fontSize: AppSizes.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColors.red),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CustomPhoneNumber(),


            // Password
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: AppTextStrings.password,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.titleOfTextField,
                    fontSize: AppSizes.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColors.red),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CustomInputField(
              hintText: AppTextStrings.password,
              controller: _passwordController,
              isPassword: true,
              heigh: AppHeight.h53,
            ),
            VerticalSpace(height: AppHeight.h40),

            PrimaryButton(
              label: AppTextStrings.update,
              onPressed: () {
                // Handle update
              },
              width: double.infinity,
              color: AppColors.primaryGreen,
            ),
            VerticalSpace(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
