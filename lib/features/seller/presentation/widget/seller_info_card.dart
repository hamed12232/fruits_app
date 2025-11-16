import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class SellerInfoCard extends StatelessWidget {
  const SellerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
      margin: EdgeInsets.symmetric(horizontal: AppWidth.w16),
      padding: EdgeInsets.all(AppWidth.w16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.r25,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo (Circular)
              Container(
                width: AppWidth.w80,
                height: AppHeight.h80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardBackground,
                ),
                child: ClipOval(
                  child: Image.asset(
                    AppImagesStrings.companyLogo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.cardBackground,
                        child: Icon(
                          Icons.store,
                          size: AppWidth.w40,
                          color: AppColors.primaryGreen,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: AppWidth.w16),
              // Seller Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seller name',
                      style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                        fontSize: AppSizes.sp19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpace(height: AppHeight.h7),
                    Text(
                      'Delivery : 40 to 60 Min',
                      style: AppTextTheme.lightTextTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.greyTextColor,
                            fontSize: AppSizes.sp14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    VerticalSpace(height: AppHeight.h8),
                    Row(
                      children: [
                        // Green circle for Open status
                        Container(
                          width: AppWidth.w8,
                          height: AppHeight.h8,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: AppWidth.w4),
                        Text(
                          'Open',
                          style: AppTextTheme.lightTextTheme.labelMedium
                              ?.copyWith(
                                fontSize: AppSizes.sp14,
                                color: AppColors.green,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        SizedBox(width: AppWidth.w8),
                        // Grey dot separator
                        Container(
                          width: AppWidth.w5,
                          height: AppHeight.h8,
                          decoration: BoxDecoration(
                            color: AppColors.greyTextColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: AppWidth.w8),
                        Text(
                          '4.5',
                          style: AppTextTheme.lightTextTheme.labelMedium
                              ?.copyWith(
                                fontSize: AppSizes.sp14,
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Discount Badge in top right
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(AppImagesStrings.badge,
            width: AppWidth.w22,
            height: AppHeight.h22,
            fit: BoxFit.cover,
            )
          ),
        ],
      ),
    );
  
  }
}