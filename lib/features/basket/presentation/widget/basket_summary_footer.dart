import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';

class BasketSummaryFooter extends StatelessWidget {
  final int itemCount;
  final double bagTotal;
  final VoidCallback onCheckout;

  const BasketSummaryFooter({
    super.key,
    required this.itemCount,
    required this.bagTotal,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$itemCount items in cart',
              style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
                fontSize: AppSizes.sp14,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: AppHeight.h4),
            Text(
              '${bagTotal.toStringAsFixed(2)} KD',
              style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                fontSize: AppSizes.sp19,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        PrimaryButton(
          label: 'Checkout',
          onPressed: onCheckout,
          height: AppHeight.h40,
        ),
      ],
    );
  }
}
