import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item_landscape.dart';

class FavoriteScreenLandscape extends StatelessWidget {
  const FavoriteScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(
        title: AppTextStrings.favorite,
        showBackButton: false,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10
                ),
                child: SellerProductListItemLandscape(
                  productName: 'Product name',
                  currentPrice: '12.00 KD',
                  originalPrice: '14.00 KD',
                  hasDiscount: true,
                  isFavorite: true,
                  storeName: 'Store 1',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
