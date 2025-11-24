import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/basket/presentation/widget/basket_summary_section.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_main_screen.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class BasketScreenDesktop extends StatelessWidget {
  const BasketScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    const double subtotal = 36.00;
    const double shippingCharges = 1.50;
    const int itemCount = 4;

    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(title: AppTextStrings.basket),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1400),
          padding: EdgeInsets.all(32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Products list
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SellerProductListItem(
                        productName: 'Product name',
                        currentPrice: '12.00 KD',
                        originalPrice: '14.00 KD',
                        hasDiscount: true,
                        isBasket: true,
                      ),
                      VerticalSpace(height: 16),
                      SellerProductListItem(
                        productName: 'Product name',
                        currentPrice: '12.00 KD',
                        originalPrice: '14.00 KD',
                        hasDiscount: true,
                        isBasket: true,
                      ),
                      VerticalSpace(height: 16),
                      SellerProductListItem(
                        productName: 'Product name',
                        currentPrice: '12.00 KD',
                        originalPrice: '14.00 KD',
                        hasDiscount: true,
                        isBasket: true,
                      ),
                      VerticalSpace(height: 16),
                      SellerProductListItem(
                        productName: 'Product name',
                        currentPrice: '12.00 KD',
                        originalPrice: '14.00 KD',
                        hasDiscount: true,
                        isBasket: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 32),
              // Summary sidebar
              SizedBox(
                width: 400,
                child: BasketSummarySection(
                  subtotal: subtotal,
                  shippingCharges: shippingCharges,
                  itemCount: itemCount,
                  onCheckout: () {
                    Navigator.pushNamed(context, CheckoutMainScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
