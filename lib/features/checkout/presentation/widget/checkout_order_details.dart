import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/basket/presentation/widget/basket_cost_row.dart';

class CheckoutOrdersDetails extends StatelessWidget {
  const CheckoutOrdersDetails({
    super.key,
    required this.items,
    required this.subtotal,
    required this.shipping,
    this.fontSize,
  });

  final int items;
  final double subtotal;
  final double shipping;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppWidth.w12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Items',
                style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
                  fontSize:fontSize?? AppSizes.sp16,
                  color: AppColors.light2Gray,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$items Items in cart',
                style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
                  fontSize:fontSize?? AppSizes.sp16,
                  color: AppColors.light2Gray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h12),
          BasketCostRow(label: 'Subtotal', amount: subtotal, isBold: false,
          fontSize: fontSize,
          ),
          SizedBox(height: AppHeight.h12),
          BasketCostRow(
            label: 'Shipping Charges',
            amount: shipping,
            isBold: false,
            fontSize: fontSize,
          ),
          SizedBox(height: AppHeight.h12),
          Divider(color: AppColors.lightGray, thickness: 1.5),
          SizedBox(height: AppHeight.h12),
          BasketCostRow(
            label: 'Bag Total',
            fontSize: fontSize,
            amount: subtotal + shipping,
            isBold: true,
          ),
        ],
      ),
    );
  }
}
