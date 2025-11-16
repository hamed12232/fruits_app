import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({super.key});

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  // --- التغيير: جعلناه nullable ليقبل Hint ---
  String? selectedValue;
  // ------------------------------------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppHeight.h20, bottom: AppHeight.h12),
      child: Material(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.25),
        borderRadius: AppBorderRadius.r25,
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          hint: Text(
            "All Areas",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.greyTextColor,
                  fontSize: AppSizes.sp16,
                  fontWeight: FontWeight.w400,
                ),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.titleOfTextField,
              size: AppSizes.sp35,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: AppBorderRadius.r25,
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.r25,
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.r25,
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: AppHeight.h5),
          ),
          
          dropdownColor: Colors.white,
          icon: const SizedBox(), 
          
          items: <String>['Option 1', 'Option 2', 'Option 3'].map((
            String value,
          ) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.greyTextColor,
                      fontSize: AppSizes.sp16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}