import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

import 'basket_cost_row.dart';
import 'basket_dashed_line.dart';
import 'basket_summary_footer.dart';

class BasketSummarySection extends StatelessWidget {
  final double subtotal;
  final double shippingCharges;
  final int itemCount;
  final VoidCallback onCheckout;

  const BasketSummarySection({
    super.key,
    required this.subtotal,
    required this.shippingCharges,
    required this.itemCount,
    required this.onCheckout,
  });

  double get bagTotal => subtotal + shippingCharges;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppWidth.w16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r25),
          topRight: Radius.circular(AppSizes.r25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BasketDashedLine(),
          SizedBox(height: AppHeight.h16),
          BasketCostRow(label: 'Subtotal', amount: subtotal, isBold: false),
          SizedBox(height: AppHeight.h12),
          BasketCostRow(
            label: 'Shipping Charges',
            amount: shippingCharges,
            isBold: false,
          ),
          SizedBox(height: AppHeight.h12),
          BasketCostRow(label: 'Bag Total', amount: bagTotal, isBold: true),
          SizedBox(height: AppHeight.h16),
          BasketSummaryFooter(
            itemCount: itemCount,
            bagTotal: bagTotal,
            onCheckout: onCheckout,
            
          ),
        ],
      ),
    );
  }
}
