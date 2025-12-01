import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';

class TimerSection extends StatelessWidget {
  final int start;
  final bool canResend;
  final VoidCallback onResend;

  const TimerSection({
    super.key,
    required this.start,
    required this.canResend,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          canResend ? '00' : '$start',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: AppColors.darkGray,
            fontSize: AppSizes.sp30,
            fontWeight: FontWeight.w400,
          ),
        ),
        VerticalSpace(height: AppHeight.h33),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppTextStrings.notReceived,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.darkGray),
              ),
              TextSpan(
                text: ' ${AppTextStrings.sendAgain}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: canResend ? AppColors.darkBlue : AppColors.lightGray,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = canResend ? onResend : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
