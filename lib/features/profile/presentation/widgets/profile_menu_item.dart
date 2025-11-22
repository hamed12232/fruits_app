import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final bool isLast;
  final double? iconWidth;
  final double? iconHeight;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.isLast = false, 
    this.iconWidth, this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            iconPath,
            width:  iconWidth?? AppSizes.sp24,
            height:iconHeight?? AppSizes.sp24,
            color: AppColors.primaryGreen,
            fit: BoxFit.contain,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.headlineTextColor,
              fontSize: AppSizes.sp16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: AppSizes.sp16,
            color: AppColors.greyTextColor,
          ),
        ),
        if (!isLast)
          Divider(color: AppColors.lightGray.withOpacity(0.5), thickness: 1),
      ],
    );
  }
}
