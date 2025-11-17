import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_widget.dart';
import 'package:fruits_app/features/checkout/presentation/widget/selectable_widgets/selectable_item.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: AppWidth.w24,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppTextStrings.checkout,
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: AppSizes.sp24,
          ),
        ),
      ),
      backgroundColor: AppColors.homebackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h10),
            CheckoutStepper(activeStep: 0),
            VerticalSpace(height: AppHeight.h16),
            SelectableWidget(title: "Now"),
            VerticalSpace(height: AppHeight.h16),
            SelectableWidget(
              title: "Select Delivery Time",
              showDateSelector: true,
              onDateSelected: (date) {},
              initialDate: DateTime.now().add(const Duration(days: 1)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: PrimaryButton(
                label: "Next",
                width: double.infinity,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
