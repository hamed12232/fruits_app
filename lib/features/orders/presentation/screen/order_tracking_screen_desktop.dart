import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/cancel_dialog.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_info_section.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_timeline.dart';

class OrderTrackingScreenDesktop extends StatelessWidget {
  const OrderTrackingScreenDesktop({super.key});

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
              // Left side - Timeline
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(children: [const OrderTimeline()]),
                ),
              ),
              SizedBox(width: 32),
              // Right side - Order Info and Actions
              SizedBox(
                width: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const OrderInfoSection(
                        orderCode: '#882610',
                        itemsCount: '3',
                        price: '37.50 KD',
                        paymentMethod: AppTextStrings.cash,
                      ),
                      SizedBox(height: 32),
                      PrimaryButton(
                        label: AppTextStrings.confirmOrder,
                        onPressed: () {
                          cancelDialogPortreit(context);
                        },
                        width: double.infinity,
                        color: AppColors.primaryGreen,
                      ),
                      SizedBox(height: 16),
                      PrimaryButton(
                        label: AppTextStrings.cancelOrder,
                        onPressed: () {},
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
