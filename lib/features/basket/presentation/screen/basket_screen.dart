import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/basket/presentation/widget/basket_summary_section.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_main_screen.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});
  static const String routeName = '/basket';

  @override
  Widget build(BuildContext context) {
    // Calculate totals (in a real app, this would come from state management)
    const double subtotal = 36.00;
    const double shippingCharges = 1.50;
    const int itemCount = 4;

    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(title: AppTextStrings.basket),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(height: AppHeight.h12),
                  SellerProductListItem(
                    productName: 'Product name',
                    currentPrice: '12.00 KD',
                    originalPrice: '14.00 KD',
                    hasDiscount: true,
                    isBasket: true,
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  SellerProductListItem(
                    productName: 'Product name',
                    currentPrice: '12.00 KD',
                    originalPrice: '14.00 KD',
                    hasDiscount: true,
                    isBasket: true,
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  SellerProductListItem(
                    productName: 'Product name',
                    currentPrice: '12.00 KD',
                    originalPrice: '14.00 KD',
                    hasDiscount: true,
                    isBasket: true,
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  SellerProductListItem(
                    productName: 'Product name',
                    currentPrice: '12.00 KD',
                    originalPrice: '14.00 KD',
                    hasDiscount: true,
                    isBasket: true,
                  ),
                  VerticalSpace(height: AppHeight.h16),
                ],
              ),
            ),
          ),
          // Fixed bottom summary section
          BasketSummarySection(
            subtotal: subtotal,
            shippingCharges: shippingCharges,
            itemCount: itemCount,
            onCheckout: () {
              Navigator.pushNamed(context, CheckoutMainScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
