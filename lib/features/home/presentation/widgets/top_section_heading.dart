
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class TopSectionHeading extends StatelessWidget {
  const TopSectionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sellers',
            style: Theme.of(context).textTheme.displayLarge
                ?.copyWith(fontSize: AppSizes.sp16),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Show all',
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: AppColors.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
