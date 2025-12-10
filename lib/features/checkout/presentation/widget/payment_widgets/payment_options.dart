import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key, required this.title, required this.leading, this.fontSize});
  final String title;
  final Widget leading;
  final double? fontSize;
  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? AppColors.primaryGreen : AppColors.lightGray,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: () => setState(() => isSelected = !isSelected),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              widget.leading,
              SizedBox(width: AppWidth.w12),
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontSize: widget.fontSize?? AppSizes.sp16,
                    fontWeight: FontWeight.w600,
                  ),
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
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
