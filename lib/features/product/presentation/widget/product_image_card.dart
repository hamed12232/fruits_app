import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class ProductImageCard extends StatelessWidget {
  final String imagePath;
  final bool hasDiscount;
  final String discountText;
  final double? height;

  const ProductImageCard({
    super.key,
    required this.imagePath,
    this.hasDiscount = false,
    this.discountText = '10% Off Discount',
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppWidth.w16),
      height: height ?? AppHeight.h221,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: AppBorderRadius.r25,
      ),
      child: Stack(
        children: [
          // Product Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: AppBorderRadius.r25,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              
              ),
            ),
          ),
          // Discount Badge
          if (hasDiscount)
            Positioned(
              top: AppHeight.h16,
              right: AppWidth.w16,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w12,
                  vertical: AppHeight.h8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.r8),
                ),
                child: Text(
                  discountText,
                  style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: AppSizes.sp12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

