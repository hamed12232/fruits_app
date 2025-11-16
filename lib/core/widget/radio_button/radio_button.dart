import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  bool offersSelected = false;
  bool freeDeliverySelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            "Offers",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.greyTextColor,
              fontSize: AppSizes.sp16,
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: Checkbox(
            value: offersSelected,
            checkColor: AppColors.primaryGreen,
            activeColor: AppColors.white,
            side: BorderSide(color: AppColors.primaryGreen),
            shape: const CircleBorder(
              side: BorderSide(color: AppColors.primaryGreen),
            ),
            onChanged: (bool? value) {
              setState(() {
                offersSelected = value!;
              });
            },
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          horizontalTitleGap: 0,
          title: Text(
            "Free Delivery",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.greyTextColor,
              fontSize: AppSizes.sp16,
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: Checkbox(
            value: freeDeliverySelected,
            checkColor: AppColors.primaryGreen,
            activeColor: AppColors.white,
            side: BorderSide(color: AppColors.primaryGreen),

            shape:  CircleBorder(),
            onChanged: (bool? value) {
              setState(() {
                freeDeliverySelected = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
