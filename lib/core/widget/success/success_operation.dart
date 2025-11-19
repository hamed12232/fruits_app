import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/failure/failure.dart';
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class SuccessOperation extends StatelessWidget {
  const SuccessOperation({super.key});
  static const String routeName = '/success_operation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.black.withOpacity(0.1), // خط خفيف تحت الـ AppBar
          ),
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: AppWidth.w24,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppTextStrings.checkout,
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: AppSizes.sp24,
          ),
        ),
      ),
      backgroundColor: AppColors.homebackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImagesStrings.success),
            VerticalSpace(height: AppHeight.h68),
            Text(
              "YOUR ORDER IS CONFIRMED!",
              style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
                color: AppColors.primaryGreen,
                fontSize: AppSizes.sp24,
              ),
            ),
            VerticalSpace(height: AppHeight.h10),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Your order code: #243188",
                style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                  color: AppColors.light2Gray,
                  fontSize: AppSizes.sp20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Thank you for choosing our products!",
                style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                  color: AppColors.light2Gray,
                  fontSize: AppSizes.sp20,
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h30),
            PrimaryButton(label: "Continue Shopping", onPressed: () {
              Navigator.of( context).pushNamed(MainNavigationScreen.routeName);
            },
            width: AppWidth.w354,
            ),
            VerticalSpace(height: AppHeight.h22),
            PrimaryButton(label: "Track Your Order", onPressed: () {
              Navigator.of( context).pushNamed(FailureOperation.routeName);
            },
            color: AppColors.white,
              width: AppWidth.w354,
              textColor: AppColors.primaryGreen,
              borderColor: AppColors.primaryGreen,
            ),
          ],
        ),
      ),
    );
  }
}
