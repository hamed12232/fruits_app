import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class ProductAddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? height;
  final double? fontSize;

  const ProductAddToCartButton({
    super.key,
    required this.onPressed,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: AppWidth.w20,
        bottom:  AppWidth.w90,
      ),
      child: SizedBox(
      
        height: height ?? AppHeight.h56,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius.r25,
            ),
            elevation: 0,
          ),
          icon: Image.asset(
            AppImagesStrings.addToCart,
          
            fit: BoxFit.cover,
          //  color: AppColors.primaryGreen,
          ),
          label: Text(
            'Add to Cart',
            style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontSize:fontSize?? AppSizes.sp16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

