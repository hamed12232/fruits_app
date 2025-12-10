import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/product/presentation/widget/product_add_to_cart_button.dart';
import 'package:fruits_app/features/product/presentation/widget/product_details_section.dart';
import 'package:fruits_app/features/product/presentation/widget/product_expandable_section.dart';
import 'package:fruits_app/features/product/presentation/widget/product_image_card.dart';

class ProductScreenLandscape extends StatelessWidget {
  const ProductScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.black.withOpacity(0.1)),
        ),
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
          'Product Name',
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: 28,
          ),
        ),
        actions: [
          Image.asset(
            AppImagesStrings.favoriteIcon,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
            color: AppColors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.share, color: AppColors.black, size: 28),
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(32),
                child: ProductImageCard(
                  imagePath: AppImagesStrings.product,
                  hasDiscount: true,
                  discountText: '10% Off Discount',
                  height: AppHeight.h348,
                ),
              ),
              ProductDetailsSection(
                categoryName: 'Category Name',
                productName: 'Product name',
                currentPrice: 'KD12.00',
                originalPrice: 'KD14.00',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                sellPer: 'Kartoon',
                fontSize: AppSizes.sp10,
              ),
              VerticalSpace(height: 24),
              ProductExpandableSection(
                title: 'Select weight',
                fontSize: AppSizes.sp10,
                options: [
                  {'label': '50 Gram', 'price': '4.00 KD'},
                  {'label': '1 Kg', 'price': '6.25 KD'},
                  {'label': '2 Kg', 'price': '12.00 KD'},
                ],
                isInitiallyExpanded: false,
              ),
              VerticalSpace(height: 16),
              ProductExpandableSection(
                title: 'Select Addons',
                fontSize: AppSizes.sp10,
                options: [
                  {'label': '50 Gram', 'price': '4.00 KD'},
                  {'label': '1 Kg', 'price': '6.25 KD'},
                ],
                isInitiallyExpanded: true,
              ),
              VerticalSpace(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: ProductAddToCartButton(
                  onPressed: () {},
                  fontSize: AppSizes.sp12,
                  height: AppHeight.h87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
