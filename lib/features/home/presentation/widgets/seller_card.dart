import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/features/seller/presentation/screen/seller_screen.dart';

class SellerCard extends StatelessWidget {
  final String sellerName;
  final String deliveryCharge;
  final String category;
  final String distance;
  final double rating;
  final bool isOpen;

  const SellerCard({
    super.key,
    required this.sellerName,
    required this.deliveryCharge,
    required this.category,
    required this.distance,
    required this.rating,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SellerScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppHeight.h12),
        padding: EdgeInsets.all(AppWidth.w12),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.r20),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Logo
            SizedBox(
              height: AppHeight.h80,

              child: ClipRRect(
                child: Image.asset(
                  AppImagesStrings.companyLogo,
                  fit: BoxFit.cover,
                  cacheWidth: (AppWidth.w60 * 2).toInt(),
                  cacheHeight: (AppHeight.h60 * 2).toInt(),
                ),
              ),
            ),
            SizedBox(width: AppWidth.w24),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sellerName,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: AppColors.greyTextColor,
                                  fontSize: AppSizes.sp14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeight.h7),
                  Row(
                    children: [
                      Image.asset(AppImagesStrings.fesba),

                      SizedBox(width: AppWidth.w4),
                      Text(
                        'Delivery Charges : $deliveryCharge',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: AppColors.greyTextColor,
                              fontSize: AppSizes.sp14,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeight.h10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: AppWidth.w5,
                            height: AppHeight.h8,
                            decoration: BoxDecoration(
                              color: isOpen ? AppColors.green : AppColors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: AppWidth.w4),
                          Text(
                            isOpen ? 'Open' : 'Close',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontSize: AppSizes.sp12,
                                  color: isOpen
                                      ? AppColors.green
                                      : AppColors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(width: AppWidth.w8),
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
                            category,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: AppColors.categoryNameColor,
                                  fontSize: AppSizes.sp14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            distance,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: AppColors.primaryGreen,
                                  fontSize: AppSizes.sp12,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(width: AppWidth.w4),
                          Icon(
                            Icons.location_on,
                            size: AppWidth.w14,
                            color: AppColors.primaryGreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
