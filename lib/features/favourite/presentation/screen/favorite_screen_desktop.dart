import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class FavoriteScreenDesktop extends StatelessWidget {
  const FavoriteScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(title: AppTextStrings.favorite),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.all(32),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 3,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return SellerProductListItem(
                productName: 'Product name',
                currentPrice: '12.00 KD',
                originalPrice: '14.00 KD',
                hasDiscount: true,
                isFavorite: true,
                storeName: 'Store 1',
              );
            },
          ),
        ),
      ),
    );
  }
}
