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
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

class FailureOperation extends StatelessWidget {
  const FailureOperation({super.key});
  static const String routeName = '/failure_operation';

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
            SvgPicture.asset(AppImagesStrings.fail),
            VerticalSpace(height: AppHeight.h33),
            Text(
              "OPS",
              style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
                color: AppColors.failureColor,
                fontSize: AppSizes.sp24,
              ),
            ),
            VerticalSpace(height: AppHeight.h12),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Error while confirming your payment/order",
                style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                  color: AppColors.light2Gray,
                  fontSize: AppSizes.sp18,
                ),
              ),
            ),
            
            VerticalSpace(height: AppHeight.h79),
            PrimaryButton(label: "Back", onPressed: () {
              Navigator.of( context).pushNamed(MainNavigationScreen.routeName);
            },
            width: AppWidth.w354,
            color: AppColors.failureColor,
            ),
            
          ],
        ),
      ),
    );
  }
}
