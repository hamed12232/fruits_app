import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';

class OrderInfoSection extends StatelessWidget {
  final String orderCode;
  final String itemsCount;
  final String price;
  final String paymentMethod;

  const OrderInfoSection({
    super.key,
    required this.orderCode,
    required this.itemsCount,
    required this.price,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: '${AppTextStrings.yourOrderCode}: ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.light2Gray),
            children: [
              TextSpan(
                text: orderCode,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.light2Gray,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h8),
        Text(
          '$itemsCount items - $price',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.light2Gray),
        ),
        SizedBox(height: AppHeight.h8),
        Text(
          '${AppTextStrings.paymentMethod} : $paymentMethod',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.light2Gray),
        ),
      ],
    );
  }
}
