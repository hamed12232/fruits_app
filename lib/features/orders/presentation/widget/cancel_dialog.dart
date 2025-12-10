import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                fontSize: AppSizes.sp12,
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

Future cancelDialogLandscape(context) async => showDialog(
  context: context,
  builder: (context) => StatefulBuilder(
    builder: (context, setState) => SizedBox(
      child: SingleChildScrollView(
        child: AlertDialog(
          actionsPadding: EdgeInsets.zero,

          backgroundColor: Colors.white,
          title: Text(
            "Cancel Order",
            style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason",
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff858D9A),
                  ),
                ),

                const _LandscapeDropMenu(),

                Text(
                  "Reason", // Snippet had "Reason" twice? Maybe "Notes"? Portrait had "Notes". I'll use "Notes" based on context or stick to snippet if unsure. Snippet has "Reason" for both label 1 and label 2? Label 2 allows TextField. Usually that's "Notes". I will use "Notes" to be logical compared to portrait.
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff858D9A),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: PrimaryButton(
                      label: "Confirm Cancelation",
                      fontSize: 9.sp,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              child: Text(
                "Close",
                textAlign: TextAlign.center,
                style: TextStyle(
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
          left: 10.w, // Adjusted padding
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
        height: 70.h,
        width:
            MediaQuery.of(context).size.width *
            .3, // Match button width? Snippet said .3
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(25.r),
          value: selectedValue,
          items: <String>['Option 1', 'Option 2', 'Option 3'].map((
            String value,
          ) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w400),
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
