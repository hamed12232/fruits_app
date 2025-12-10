import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/features/orders/presentation/screen/order_tracking_screen.dart';

class OrderCardLandscape extends StatelessWidget {
  final String orderId;
  final String price;
  final String date;
  final String itemsCount;
  final String status;
  final Color statusColor;
  final String statusIcon;
  final Color statusIconBackground;

  const OrderCardLandscape({
    super.key,
    required this.orderId,
    required this.price,
    required this.date,
    required this.itemsCount,
    required this.status,
    required this.statusColor,
    required this.statusIcon,
    required this.statusIconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppHeight.h20,
        horizontal: AppWidth.w20,
      ),
      padding: EdgeInsets.all(AppSizes.sp15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r11),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: AppWidth.w100,
            height: AppHeight.h140,
            decoration: BoxDecoration(
              color: statusIconBackground,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(AppSizes.sp16),
            child: SvgPicture.asset(statusIcon),
          ),
          SizedBox(width: AppWidth.w15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$orderId - $price',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.sp15,
                  ),
                ),
                SizedBox(height: AppHeight.h5),
                Text(
                  '$date • $itemsCount items',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: AppSizes.sp10,
                  ),
                ),
                SizedBox(height: AppHeight.h5),
                Row(
                  children: [
                    Text(
                      'Status : ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyTextColor,
                        fontSize: AppSizes.sp10,
                      ),
                    ),
                    Text(
                      status,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.sp10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, OrderTrackingScreen.routeName);
            },
            child: Container(
              width: AppWidth.w100,
              height: AppHeight.h140,
              decoration: BoxDecoration(
                color: statusIconBackground.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(AppSizes.sp20),
              child: SvgPicture.asset(AppImagesStrings.goOrder,
            
              ),
            ),
          ),
        ],
      ),
    );
  }
}
