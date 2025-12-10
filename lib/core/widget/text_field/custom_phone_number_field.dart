import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneNumber extends StatelessWidget {
  final double fontSize;
  final double iconSize;

  const CustomPhoneNumber({super.key, this.fontSize = 14, this.iconSize = 35});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      showCountryFlag: false,

      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.titleOfTextField,
        size: iconSize,
      ),
      dropdownTextStyle: TextStyle(fontSize: fontSize),
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        hintText: 'Mobile Number',
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),

        //    border: OutlineInputBorder(borderSide: BorderSide()),
      ),
      initialCountryCode: 'KW',
      onChanged: (phone) {},
    );
  }
}
