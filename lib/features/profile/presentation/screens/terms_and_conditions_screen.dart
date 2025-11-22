import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});
  static const String routeName = '/terms-and-conditions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppTextStrings.termsAndConditions),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w20),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h30),
            Text(
              AppTextStrings.termsAndConditionsContent,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: AppSizes.sp19,
                fontWeight: FontWeight.w400,
              ),
            ),
            VerticalSpace(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
