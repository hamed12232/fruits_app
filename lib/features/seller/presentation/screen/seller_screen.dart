import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_categories_section.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_info_card.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_products_section.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({super.key});
  static const String routeName = '/seller';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: AppWidth.w24,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppTextStrings.fruitMarket,
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: AppSizes.sp24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppImagesStrings.searchIcon, width: AppWidth.w25,
            color: AppColors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: AppHeight.h8),
              const SellerInfoCard(),
              VerticalSpace(height: AppHeight.h16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
                child: const SellerCategoriesSection(),
              ),
              VerticalSpace(height: AppHeight.h16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
                child: const SellerProductsSection(),
              ),
              VerticalSpace(height: AppHeight.h16),
            ],
          ),
        ),
      ),
    );
  }
}
