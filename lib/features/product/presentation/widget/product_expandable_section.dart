import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/product/presentation/widget/product_option_radio.dart';

class ProductExpandableSection extends StatefulWidget {
  final String title;
  final List<Map<String, String>> options;
  final int? selectedIndex;
  final Function(int) onOptionSelected;

  const ProductExpandableSection({
    super.key,
    required this.title,
    required this.options,
    this.selectedIndex,
    required this.onOptionSelected,
  });

  @override
  State<ProductExpandableSection> createState() => _ProductExpandableSectionState();
}

class _ProductExpandableSectionState extends State<ProductExpandableSection> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    // Default to expanded for "Select Addons", collapsed for "Select weight"
    _isExpanded = widget.title == 'Select Addons';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppWidth.w16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppHeight.h16,
                horizontal: AppWidth.w16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                      fontSize: AppSizes.sp19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                    color: AppColors.black,
                    size: AppWidth.w24,
                  ),
                ],
              ),
            ),
          ),
          // Options
          if (_isExpanded) ...[
            Padding(
              padding: EdgeInsets.only(
                left: AppWidth.w16,
                right: AppWidth.w16,
                bottom: AppHeight.h16,
              ),
              child: Column(
                children: widget.options.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  return ProductOptionRadio(
                    label: option['label']!,
                    price: option['price']!,
                    isSelected: widget.selectedIndex == index,
                    onTap: () {
                      widget.onOptionSelected(index);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

