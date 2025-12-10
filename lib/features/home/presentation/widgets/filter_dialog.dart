import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

Future filterDialogPortreit(context) async {
  String? selectedValue;
  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => SizedBox(
        height: AppHeight.h348,
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.r25),
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
              DropMenu(
                items: const ['Option 1', 'Option 2', 'Option 3'],
                hint: 'All Areas',
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
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
}

Future filterDialogLandscape(context) async => showDialog(
  context: context,
  builder: (context) => StatefulBuilder(
    builder: (context, setState) => SizedBox(
      height: 400.h,
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          "Filter by",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),

        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Delivered To",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff858D9A),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(AppImagesStrings.fesba),
                ],
              ),
              const Row(
                children: [
                  _LandscapeDropMenu(),
                  Expanded(child: _LandscapeRadioButton()),
                ],
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: PrimaryButton(
                  label: "Apply Filter",
                  onPressed: () {},
                  // fontSize: 9, fontWeight: bold - PrimaryButton handles style usually, or I leave default.
                ),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        contentPadding: EdgeInsets.only(
          left: 29.w,
          bottom: 23.h,
          top: 21.h,
          right: 29.w,
        ),
        actionsPadding: const EdgeInsets.all(0),
        actions: [
          TextButton(
            child: Text(
              "Close",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff656565),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
    ),
  ),
);

class _LandscapeDropMenu extends StatefulWidget {
  const _LandscapeDropMenu();

  @override
  State<_LandscapeDropMenu> createState() => _LandscapeDropMenuState();
}

class _LandscapeDropMenuState extends State<_LandscapeDropMenu> {
  String selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
      child: Container(
        padding: EdgeInsets.only(
          left: 1.w,
          right: 18.w,
          top: 10.h,
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ],
        ),
        // height: 60.h,
        width:
            MediaQuery.of(context).size.width *
            .20, // Adjusted width to fit better in landscape dialog alongside radio
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(25.r),
          value: selectedValue,
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          items: <String>['Option 1', 'Option 2', 'Option 3'].map((
            String value,
          ) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}

class _LandscapeRadioButton extends StatefulWidget {
  const _LandscapeRadioButton();

  @override
  State<_LandscapeRadioButton> createState() => _LandscapeRadioButtonState();
}

class _LandscapeRadioButtonState extends State<_LandscapeRadioButton> {
  String selectedOption = 'Option 1';

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
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
          ),
          leading: Radio<String>(
            value: 'Option 1',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          horizontalTitleGap: 0,

          title: Text(
            "Free Delivery",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
          ),
          leading: Radio<String>(
            value: 'Option 2',
            groupValue: selectedOption,
            onChanged: (String? value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
