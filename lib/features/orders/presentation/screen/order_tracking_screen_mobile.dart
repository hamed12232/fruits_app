import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/orders/presentation/widget/cancel_dialog.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_info_section.dart';
import 'package:fruits_app/features/orders/presentation/widget/order_timeline.dart';

class OrderTrackingScreenMobile extends StatelessWidget {
  const OrderTrackingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppTextStrings.orderTracking),
      backgroundColor: AppColors.homebackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: AppWidth.w27,
          right: AppWidth.w42,
          top: AppHeight.h20,
        ),
        child: Column(
          children: [
            const OrderInfoSection(
              orderCode: '#882610',
              itemsCount: '3',
              price: '37.50 KD',
              paymentMethod: AppTextStrings.cash,
            ),
            SizedBox(height: AppHeight.h24),
            const OrderTimeline(),
            SizedBox(height: AppHeight.h37),
            Padding(
              padding: EdgeInsets.only(left: AppWidth.w14),
              child: PrimaryButton(
                label: AppTextStrings.confirmOrder,
                onPressed: () {
                  cancelDialogPortreit(context);
                },
                width: double.infinity,
                color: AppColors.primaryGreen,
              ),
            ),
            SizedBox(height: AppHeight.h22),
            Padding(
              padding: EdgeInsets.only(left: AppWidth.w14),
              child: PrimaryButton(
                label: AppTextStrings.cancelOrder,
                onPressed: () {},
                width: double.infinity,
                color: AppColors.failureColor,
              ),
            ),
            SizedBox(height: AppHeight.h20),
          ],
        ),
      ),
    );
  }
}
