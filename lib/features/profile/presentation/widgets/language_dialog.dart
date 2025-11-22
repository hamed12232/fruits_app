import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  String _selectedLanguage = 'English'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.r25),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w20,
          vertical: AppHeight.h20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption(
              title: 'العربية',
              flagPath: AppImagesStrings.saudiArabia,
              value: 'Arabic',
            ),
            VerticalSpace(height: AppHeight.h16),
            _buildLanguageOption(
              title: 'English',
              flagPath: AppImagesStrings.usa,
              value: 'English',
            ),
            VerticalSpace(height: AppHeight.h30),
            PrimaryButton(
              label: 'Apply',
              onPressed: () {
                Navigator.pop(context);
              },
              width: double.infinity,
              color: AppColors.primaryGreen,
            ),
            VerticalSpace(height: AppHeight.h16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.greyTextColor,
                  fontSize: AppSizes.sp16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String title,
    required String flagPath,
    required String value,
  }) {
    final isSelected = _selectedLanguage == value;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLanguage = value;
        });
      },
      borderRadius: BorderRadius.circular(AppBorderRadius.r12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppHeight.h10),
        child: Row(
          children: [
            Container(
              width: AppSizes.sp24,
              height: AppSizes.sp24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryGreen
                      : AppColors.greyTextColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: AppSizes.sp16,
                        color: AppColors.primaryGreen,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: AppWidth.w16),
            Image.asset(flagPath, width: AppSizes.sp24, height: AppSizes.sp24),
            SizedBox(width: AppWidth.w10),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontSize: AppSizes.sp16,
                fontWeight: FontWeight.w400,
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
