import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class FavoriteScreenTablet extends StatelessWidget {
  const FavoriteScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(title: AppTextStrings.favorite,  showBackButton: false,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h12),
            SellerProductListItem(
              productName: 'Product name',
              currentPrice: '12.00 KD',
              originalPrice: '14.00 KD',
              hasDiscount: true,
              isFavorite: true,
              storeName: 'Store 1',
            ),
            VerticalSpace(height: AppHeight.h16),
            SellerProductListItem(
              productName: 'Product name',
              currentPrice: '12.00 KD',
              originalPrice: '14.00 KD',
              hasDiscount: true,
              isFavorite: true,
              storeName: 'Store 1',
            ),
            VerticalSpace(height: AppHeight.h16),
          ],
        ),
      ),
    );
  }
}
