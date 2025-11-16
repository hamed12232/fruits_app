import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class SellerCategoryItem extends StatelessWidget {
  final String image;
  final String title;

  const SellerCategoryItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.r15,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(AppWidth.w8),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.cardBackground,
                    child: Icon(
                      Icons.image,
                      size: AppWidth.w32,
                      color: AppColors.greyTextColor,
                    ),
                  );
                },
              ),
            ),
          ),
        
        Padding(
          padding: EdgeInsets.only(top: AppHeight.h8),
          child: Text(
            title,
            style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
              fontSize: AppSizes.sp14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
