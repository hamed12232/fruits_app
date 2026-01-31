import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneNumber extends StatelessWidget {
  final double fontSize;
  final double iconSize;
  final ValueChanged<PhoneNumber>? onChanged;
  final TextEditingController? controller;
  final String initialCountryCode;

  const CustomPhoneNumber({
    super.key,
    this.fontSize = 14,
    this.iconSize = 35,
    this.onChanged,
    this.controller,
    this.initialCountryCode =
        'EG', // Egypt as default for the phone format shown
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
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
      ),
      initialCountryCode: initialCountryCode,
      onChanged: onChanged,
    );
  }
}
