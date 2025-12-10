import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class ProductOptionRadio extends StatelessWidget {
  final String label;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;
  final double? fontSize;

  const ProductOptionRadio({
    super.key,
    required this.label,
    required this.price,
    required this.isSelected,
    required this.onTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppHeight.h12,
          horizontal: AppWidth.w16,
        ),
        margin: EdgeInsets.only(bottom: AppHeight.h8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.r8),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.lightGray,
            width: AppWidth.w1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: AppWidth.w20,
              height: AppHeight.h20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primaryGreen : AppColors.lightGray,
                width: AppWidth.w1,
              ),
                color: isSelected ? AppColors.primaryGreen : AppColors.white,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: AppWidth.w12,
                      color: AppColors.white,
                    )
                  : null,
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: Text(
                label,
                style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
                  fontSize:fontSize?? AppSizes.sp14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              price,
              style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                fontSize:fontSize?? AppSizes.sp14,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

