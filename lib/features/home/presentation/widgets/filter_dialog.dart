import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/drop_menu/drop_menu.dart';
import 'package:fruits_app/core/widget/radio_button/radio_button.dart';

Future filterDialogPortreit(context) async => showDialog(
  context: context,
  builder: (context) => StatefulBuilder(
    builder: (context, setState) => SizedBox(
      height: AppHeight.h348,
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.r25,
        ),
        title: Text(
          "Filter by",
          style: Theme.of(context).textTheme.labelMedium,
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Delivered To",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.titleOfTextField,
                    fontSize: AppSizes.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: AppWidth.w13),
                Image.asset(AppImagesStrings.fesba),
              ],
            ),

            const DropMenu(),
            const RadioButton(),
            VerticalSpace(height: AppHeight.h16),
            PrimaryButton(
              label: "Apply Filter",
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
