import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen.dart';

class SellerProductListItem extends StatelessWidget {
  final String productName;
  final String? currentPrice;
  final String? originalPrice;
  final String? priceText;
  final bool hasDiscount;

  const SellerProductListItem({
    super.key,
    required this.productName,
    this.currentPrice,
    this.originalPrice,
    this.priceText,
    required this.hasDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductScreen.routeName),
      child: Container(
        padding: EdgeInsets.all(AppWidth.w12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.r25,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image (Circular)
            Container(
              width: AppWidth.w80,
              height: AppHeight.h80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImagesStrings.categoryVegetables),
                    fit: BoxFit.contain,
                  ),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.lightGray.withOpacity(0.4),
                    width: AppWidth.w1,
                  ),
                ),
              
              ),
            ),
            SizedBox(width: AppWidth.w16),
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                      fontSize: AppSizes.sp16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpace(height: AppHeight.h7),
                  if (currentPrice != null)
                    Row(
                      children: [
                        Text(
                          currentPrice!,
                          style: AppTextTheme.lightTextTheme.labelMedium
                              ?.copyWith(
                                fontSize: AppSizes.sp14,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        if (originalPrice != null) ...[
                          SizedBox(width: AppWidth.w8),
                          Text(
                            originalPrice!,
                            style: AppTextTheme.lightTextTheme.labelMedium
                                ?.copyWith(
                                  fontSize: AppSizes.sp14,
                                  color: AppColors.greyTextColor,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ],
                    )
                  else if (priceText != null)
                    Text(
                      priceText!,
                      style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
                        fontSize: AppSizes.sp14,
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (hasDiscount) ...[
                    VerticalSpace(height: AppHeight.h7),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.w8,
                        vertical: AppHeight.h4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.upToTenPercentOff,
                        borderRadius: BorderRadius.circular(AppSizes.r8),
                      ),
                      child: Text(
                        'Up to 10% Off',
                        style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: AppSizes.sp12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Add to Cart Button
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImagesStrings.addToCart,
                width: AppWidth.w56,
                height: AppHeight.h52,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

