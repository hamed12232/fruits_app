import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class SelectableMainCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool showTimePicker;
  final bool showDateSelector;
  final DateTime? selectedDate;
  final VoidCallback onCardTapped;
  final VoidCallback onCalendarToggle;

  const SelectableMainCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.showTimePicker,
    required this.selectedDate,
    required this.onCardTapped,
    required this.showDateSelector,
    required this.onCalendarToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: isSelected ? 4.0 : 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: isSelected ? AppColors.primaryGreen : AppColors.lightGray,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onCardTapped,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                      fontSize: AppSizes.sp16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: AppWidth.w24,
                    height: AppHeight.h24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? AppColors.primaryGreen : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryGreen
                            : AppColors.lightGray,
                        width: 1.5,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                ],
              ),

              VerticalSpace(height: AppHeight.h10),

              // Time Picker Row
              if (showTimePicker)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('MM - dd - yyyy').format(selectedDate!),
                      style:
                          AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryGreen,
                        fontSize: AppSizes.sp16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: onCalendarToggle,
                      icon: Icon(
                        showDateSelector ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: AppColors.primaryGreen,
                        size: 25,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
