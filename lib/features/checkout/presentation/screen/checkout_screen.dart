import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/features/checkout/presentation/widget/addreess_widgets/addresss_selector.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_stepper.dart';
import 'package:fruits_app/features/checkout/presentation/widget/selectable_widgets/selectable_item.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    this.isDeliveryTime = true,
    this.isDeliveryAddress = false,
    this.index = 0,
  });
  static const String routeName = '/checkout';
  final bool isDeliveryTime;
  final bool isDeliveryAddress;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h14),
            CheckoutStepper(activeStep: index),
            VerticalSpace(height: AppHeight.h16),
            if (isDeliveryTime && !isDeliveryAddress)
              SelectableWidget(title: "Now"),
            VerticalSpace(height: AppHeight.h16),
            if (isDeliveryTime && !isDeliveryAddress)
              SelectableWidget(
                title: "Select Delivery Time",
                showDateSelector: true,
                onDateSelected: (date) {},
                initialDate: DateTime.now().add(const Duration(days: 1)),
              ),
            if (isDeliveryAddress && !isDeliveryTime)
              Expanded(child: AddressSelector()),
          ],
        ),
      ),
    );
  }
}
