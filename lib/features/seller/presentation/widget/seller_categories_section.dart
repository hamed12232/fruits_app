import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_category_item.dart';

class SellerCategoriesSection extends StatelessWidget {
  const SellerCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
            fontSize: AppSizes.sp19,
            fontWeight: FontWeight.bold,
          ),
        ),
        VerticalSpace(height: AppHeight.h12),
        Row(
          children: [
            Expanded(
              child: SellerCategoryItem(
                image: AppImagesStrings.categoryFruits,
                title: 'Fruits',
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: SellerCategoryItem(
                image: AppImagesStrings.categoryVegetables,
                title: 'Vegetables',
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: SellerCategoryItem(
                image: AppImagesStrings.pets,
                title: 'Phone',
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: SellerCategoryItem(
                image: AppImagesStrings.pets,
                title: 'Pets',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

