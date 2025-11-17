import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class BasketCostRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isBold;

  const BasketCostRow({
    super.key,
    required this.label,
    required this.amount,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
            fontSize: AppSizes.sp14,
            color: AppColors.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        Text(
          '${amount.toStringAsFixed(2)} KD',
          style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(
            fontSize: AppSizes.sp14,
            color: isBold ? AppColors.primaryGreen : AppColors.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
