import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimeLineLandscape extends StatelessWidget {
  const OrderTimeLineLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimelineTile(
          isFirst: true,
          isLast: false,
          isPast: false,
          title: AppTextStrings.delivered,
          description: 'Estimated for 10 September, 2021',
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: false,
          isPast: false,
          title: AppTextStrings.outForDelivery,
          description: 'Estimated for 10 September, 2021',
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: false,
          isPast: true,
          title: AppTextStrings.orderShipped,
          description: 'Estimated for 10 September, 2021',
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: false,
          isPast: true,
          title: AppTextStrings.confirmed,
          description: 'Your order has been confirmed',
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: true,
          isPast: true,
          title: AppTextStrings.orderPlaced,
          description: 'We have received your order',
        ),
      ],
    );
  }

  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required bool isPast,
    required String title,
    required String description,
  }) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color:  AppColors.trackingSuccessColor,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: 15,
        height: 15,
        indicator: Container(
          decoration: BoxDecoration(
            color: isPast ? AppColors.trackingSuccessColor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.trackingSuccessColor, width: 2),
          ),
        ),
      ),
      endChild: Container(
        margin: EdgeInsets.only(
          left: 15,
          bottom: AppHeight.h10,
          top: AppHeight.h10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.sp12,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: AppHeight.h5),
            Text(
              description,
              style: TextStyle(
                color: AppColors.light2Gray,
                fontSize: AppSizes.sp10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
