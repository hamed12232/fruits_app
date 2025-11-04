
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneNumber extends StatelessWidget {
  const CustomPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      showCountryFlag: false,
      
      
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.titleOfTextField,
        size: AppSizes.sp35,
        
      ),
      decoration: InputDecoration(
        hintText: 'Mobile Number',
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: AppSizes.sp14,
          fontWeight: FontWeight.w500,
        ),
    
    //    border: OutlineInputBorder(borderSide: BorderSide()),
      ),
      initialCountryCode: 'KW',
      onChanged: (phone) {},
    );
  }
}