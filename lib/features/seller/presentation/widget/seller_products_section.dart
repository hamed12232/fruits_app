import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class SellerProductsSection extends StatelessWidget {
  const SellerProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Products',
              style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                fontSize: AppSizes.sp19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(AppImagesStrings.format),
          ],
        ),
        VerticalSpace(height: AppHeight.h12),
        SellerProductListItem(
          productName: 'Product name',
          currentPrice: '12.00 KD',
          originalPrice: '14.00 KD',
          hasDiscount: true,
        ),
        VerticalSpace(height: AppHeight.h12),
        SellerProductListItem(
          productName: 'Product name',
          currentPrice: null,
          priceText: 'Price Upon Selection',
          hasDiscount: true,
        ),
        VerticalSpace(height: AppHeight.h12),
        SellerProductListItem(
          productName: 'Product name',
          currentPrice: '12.00 KD',
          originalPrice: '14.00 KD',
          hasDiscount: true,
        ),
      ],
    );
  }
}
