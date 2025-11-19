import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';

class CheckoutStepper extends StatelessWidget {
  final int activeStep;
  const CheckoutStepper({super.key, required this.activeStep});

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
    
      lineStyle: LineStyle(
        lineLength: 114.w,
        lineType: LineType.dashed,
        defaultLineColor: AppColors.lightGray,
        activeLineColor: AppColors.lightGray,
      ),
      stepRadius: 12,
      showStepBorder: true,
      borderThickness: 2,
      activeStepBorderColor: AppColors.primaryGreen,
      finishedStepBorderColor: AppColors.lightGray,
      unreachedStepBorderColor: AppColors.lightGray,
      activeStepBorderType: BorderType.normal,
     finishedStepBorderType: BorderType.normal,
      unreachedStepBorderType: BorderType.normal,
      finishedStepBackgroundColor: AppColors.homebackground,
      
      steps: [
        EasyStep(
          
        customStep: Center(
          child: Icon( 
              Icons.circle,
              size: 12.sp,
              color:  AppColors.lightGray,
            ),
        ),
          customTitle: Text(
            'Delivery Time',
            style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontSize: AppSizes.sp16,
            ),
          ),
        ),
        EasyStep(
          icon: const Icon(Icons.circle, size: 10),
  
          customTitle: Text(
            'Delivery Address',
            style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontSize: AppSizes.sp16,
            ),
          ),
          // activeTitleColor: Colors.green,
          // unreachedTitleColor: Colors.grey,
        ),
        EasyStep(
          icon: const Icon(Icons.circle, size: 10),
          customTitle: Text(
            'Payment',
            style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontSize: AppSizes.sp16,
            ),
          ),
          // activeTitleColor: Colors.green,
          // unreachedTitleColor: Colors.grey,
        ),
      ],
    );
  }
}
