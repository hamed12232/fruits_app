import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;

  const CategoryItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.r25,
        border: Border.all(color: Colors.black12, width: 1),
        color: AppColors.white,
      ),
      padding: EdgeInsets.all(AppWidth.w7),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
    
      ),
    );
  }
}
