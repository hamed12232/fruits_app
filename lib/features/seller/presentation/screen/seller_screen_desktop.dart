import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_categories_section.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_info_card.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_products_section.dart';

class SellerScreenDesktop extends StatelessWidget {
  const SellerScreenDesktop({super.key});

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
            size: 28,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppTextStrings.fruitMarket,
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppImagesStrings.searchIcon,
              width: 30,
              color: AppColors.black,
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1400),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar for seller info and categories
                Container(
                  width: 350,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SellerInfoCard(),
                      VerticalSpace(height: 24),
                      const SellerCategoriesSection(),
                    ],
                  ),
                ),
                // Main products area
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(24),
                    child: const SellerProductsSection(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
