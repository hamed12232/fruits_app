import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';

class CustomAttributeWithTextField extends StatelessWidget {
  const CustomAttributeWithTextField({
    super.key,
    required this.fullNameController,
    required this.attributeName,
    required this.hintText,
      this.fontSize,
  });

  final TextEditingController fullNameController;

  final String attributeName;
  final String hintText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text.rich(
            TextSpan(
              text: attributeName,

              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: fontSize ?? AppSizes.sp14,
                color: AppColors.titleOfTextField,
              ),

              children: [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        VerticalSpace(height: AppHeight.h14),

        CustomInputField(
          heigh: AppHeight.h52,
          controller: fullNameController,
          hintText: hintText,
          fontSize: fontSize ?? AppSizes.sp12,
        ),
      ],
    );
  }
}
