import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/cancel_dialog.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_info_section.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_time_line_landscape.dart';

class OrderTrackingScreenLandscape extends StatelessWidget {
  const OrderTrackingScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppTextStrings.orderTracking),
      backgroundColor: AppColors.homebackground,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.all(32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(children: [const OrderTimeLineLandscape()]),
                ),
              ),
              SizedBox(width: 32),
              SizedBox(
                width: 200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       OrderInfoSection(
                        orderCode: '#882610',
                        itemsCount: '3',
                        price: '37.50 KD',
                        paymentMethod: AppTextStrings.cash,
                        fontSize: AppSizes.sp7,
                      ),
                      SizedBox(height: 32),
                      PrimaryButton(
                        label: AppTextStrings.confirmOrder,
                        onPressed: () {
                          
                        },
                        width: double.infinity,
                        color: AppColors.primaryGreen,
                      ),
                      SizedBox(height: 16),
                      PrimaryButton(
                        label: AppTextStrings.cancelOrder,
                        onPressed: () {cancelDialogLandscape(context);},
                        width: double.infinity,
                        color: AppColors.failureColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
