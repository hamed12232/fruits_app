import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';


class TextFormFieldThemes {
  TextFormFieldThemes._();

  static InputDecorationTheme lightInputDecorationTheme =
       InputDecorationTheme(
        // prefixIconColor: AppColors.secondary,
        // floatingLabelStyle: const TextStyle(color: AppColors.secondary),
        border:  OutlineInputBorder(
            borderRadius: AppBorderRadius.r25,
            borderSide: BorderSide(color: AppColors.lightGray, width: 1),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: AppBorderRadius.r25,
            borderSide: BorderSide(color: AppColors.lightGray, width: 1),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: AppBorderRadius.r25,
            borderSide: BorderSide(color: AppColors.lightGray, width: 1.2),
          
          // borderSide: const BorderSide(width: 2, color: AppColors.secondary),
        ),
      );

  // static InputDecorationTheme darkInputDecorationTheme =
  //     const InputDecorationTheme(
  //       prefixIconColor: AppColors.primary,
  //       floatingLabelStyle: TextStyle(color: AppColors.primary),
  //       border:  OutlineInputBorder(
  //           borderRadius: AppBorderRadius.r8,
  //           borderSide: BorderSide(color: AppColors.grey300, width: 1),
  //         ),
  //         enabledBorder:  OutlineInputBorder(
  //           borderRadius: AppBorderRadius.r8,
  //           borderSide: BorderSide(color: AppColors.grey300, width: 1),
  //         ),
  //         focusedBorder:  OutlineInputBorder(
  //           borderRadius: AppBorderRadius.r8,
  //           borderSide: BorderSide(color: AppColors.primary, width: 1.2),
  //         ),
  //     );
}
