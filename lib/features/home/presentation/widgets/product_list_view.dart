
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_card.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sellersData.length,
        itemBuilder: (context, index) {
          final seller = sellersData[index];
          return RepaintBoundary(
            child: SellerCard(
              sellerName: seller['name'] as String,
              deliveryCharge: seller['charge'] as String,
              category: seller['category'] as String,
              distance: seller['distance'] as String,
              rating: seller['rating'] as double,
              isOpen: seller['isOpen'] as bool,
            ),
          );
        },
      ),
    );
  }
}
