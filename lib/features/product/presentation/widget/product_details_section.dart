import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class ProductDetailsSection extends StatelessWidget {
  final String categoryName;
  final String productName;
  final String currentPrice;
  final String? originalPrice;
  final String description;
  final String sellPer;

  const ProductDetailsSection({
    super.key,
    required this.categoryName,
    required this.productName,
    required this.currentPrice,
    this.originalPrice,
    required this.description,
    required this.sellPer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Name
          Text(
            categoryName,
            style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
              color: AppColors.primaryGreen,
              fontSize: AppSizes.sp16,
              fontWeight: FontWeight.w400,
            ),
          ),
        
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                  fontSize: AppSizes.sp24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Price',
                    style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
                      color: AppColors.greyTextColor,
                      fontSize: AppSizes.sp14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  VerticalSpace(height: AppHeight.h4),
                  Row(
                    children: [
                      Text(
                        currentPrice,
                        style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                          fontSize: AppSizes.sp16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      if (originalPrice != null) ...[
                        SizedBox(width: AppWidth.w8),
                        Text(
                          originalPrice!,
                          style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                            fontSize: AppSizes.sp14,
                            color: AppColors.upToTenPercentOff,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
          VerticalSpace(height: AppHeight.h12),
          // Description
          Text(
            description,
            style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
              fontSize: AppSizes.sp14,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          VerticalSpace(height: AppHeight.h12),
          // Sell Per
          Text(
            'Sell Per : $sellPer',
            style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
              fontSize: AppSizes.sp14,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

