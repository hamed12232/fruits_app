import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback onPressed;
  final Color? filledColor;
  final Color? foregroundColor;
  final bool isIcon;
  final IconData icon;

  const AuthButton({
    super.key,
    required this.label,
     this.image="",
    required this.onPressed,
    this.filledColor,
    this.foregroundColor,
    this.isIcon = false,
    this.icon = Icons.phone,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFilled = filledColor != null;
    return SizedBox(
      width: double.infinity,
      height: AppHeight.h51,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: isIcon ? Icon(icon) : Image.asset(image),
        label: Text(
          label,
          style: TextStyle(fontSize: AppSizes.sp14, fontWeight: FontWeight.w400),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? filledColor : Colors.white,
          foregroundColor: foregroundColor ?? AppColors.black87,
          elevation: isFilled ? 0 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.r28),
          ),
          side: isFilled
              ? BorderSide.none
              : BorderSide(color:  AppColors.lightGray, width: AppWidth.w1),
        ),
      ),
    );
  }
}
