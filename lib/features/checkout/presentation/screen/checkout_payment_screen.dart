import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_order_details.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_stepper.dart';
import 'package:fruits_app/features/checkout/presentation/widget/payment_widgets/coupon_card.dart';
import 'package:fruits_app/features/checkout/presentation/widget/payment_widgets/payment_options.dart';

class CheckoutPaymentScreen extends StatelessWidget {
  const CheckoutPaymentScreen({super.key, this.index = 2});
  final int index;

  @override
  Widget build(BuildContext context) {
    final double subtotal = 36.00;
    final double shipping = 1.50;
    final int items = 4;

    return Scaffold(
      backgroundColor: AppColors.homebackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VerticalSpace(height: AppHeight.h14),
            CheckoutStepper(activeStep: index),
            VerticalSpace(height: AppHeight.h16),
            Text(
              'Coupon Code',
              style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CouponCard(),
            VerticalSpace(height: AppHeight.h20),
            Text(
              'Order Details',
              style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            CheckoutOrdersDetails(
              items: items,
              subtotal: subtotal,
              shipping: shipping,
            ),
            VerticalSpace(height: AppHeight.h20),
            Text(
              'Payment',
              style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpace(height: AppHeight.h8),
            Expanded(
              child: ListView(
                children: [
                  PaymentOptions(
                    title: 'Credit Card/Debit card',
                    leading: SvgPicture.asset(AppImagesStrings.creditCard),
                  ),
                  VerticalSpace(height: AppHeight.h12),
                  PaymentOptions(
                    title: 'Cash of Delivery',
                    leading: SvgPicture.asset(AppImagesStrings.cashOfDelivery),
                  ),
                  VerticalSpace(height: AppHeight.h12),
                  PaymentOptions(
                    title: 'Knet',
                    leading: SvgPicture.asset(AppImagesStrings.knet),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
