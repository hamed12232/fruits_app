import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key, this.cardWidth, this.cardHeight, this.fontSize});
  final double? cardWidth ;
  final double? cardHeight ;
  final double? fontSize ;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:cardWidth?? AppWidth.w389,
      height:cardHeight?? AppHeight.h51,
      child: TextField(
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          hintText: 'Do You Have any Coupon Code?',
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.darkGray,
            fontSize:fontSize?? AppSizes.sp14,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.lightGray, width: 1.2),
          ),

          isDense: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: Text(
                'Apply',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontSize:fontSize?? AppSizes.sp16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
