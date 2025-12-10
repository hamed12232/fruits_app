import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed, this.fontSize});
  final void Function() onPressed;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: onPressed,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppTextStrings.skip,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontSize: fontSize ?? AppSizes.sp15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalSpace(height: AppHeight.h5),
              Container(
                height: 1,
                width: AppWidth.w31,
                color: AppColors.darkGray,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
