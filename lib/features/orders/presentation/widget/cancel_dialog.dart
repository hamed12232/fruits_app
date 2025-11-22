import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/drop_menu/drop_menu.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

Future cancelDialogPortreit(context) async {
  String? selectedValue;
  TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => SizedBox(
        height: AppHeight.h348,
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.r25),
          title: Center(
            child: Text(
              "Cancel Order",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reason",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: AppSizes.sp16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              DropMenu(
                items: const ['Option 1', 'Option 2', 'Option 3'],
                hint: 'Please select reason',
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              VerticalSpace(height: AppHeight.h16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notes",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: AppSizes.sp16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              VerticalSpace(height: AppHeight.h16),

              CustomInputField(
                hintText: "",
                controller: controller,
                heigh: AppHeight.h79,
              ),
              PrimaryButton(
                label: "Confirm Cancelation",
                onPressed: () {},
                width: AppWidth.w354,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          contentPadding: EdgeInsets.only(
            left: AppWidth.w29,
            bottom: AppHeight.h23,
            top: AppHeight.h21,
            right: AppWidth.w29,
          ),
          actions: [
            TextButton(
              child: Text(
                "Close",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.greyTextColor,
                  fontSize: AppSizes.sp16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}
