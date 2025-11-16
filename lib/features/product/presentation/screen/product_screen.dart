import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/product/presentation/widget/product_add_to_cart_button.dart';
import 'package:fruits_app/features/product/presentation/widget/product_details_section.dart';
import 'package:fruits_app/features/product/presentation/widget/product_expandable_section.dart';
import 'package:fruits_app/features/product/presentation/widget/product_image_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  static const String routeName = '/product';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int? selectedWeightIndex;
  int? selectedAddonIndex;

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
          'Product Name',
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: AppSizes.sp24,
          ),
        ),
        actions: [
          Image.asset(
            AppImagesStrings.favoriteIcon,
            width: AppWidth.w32,
            height: AppHeight.h32,
            fit: BoxFit.cover,
            color: AppColors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.share, color: AppColors.black, size: AppWidth.w24),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(height: AppHeight.h16),
                  // Product Image Card
                  ProductImageCard(
                    imagePath: AppImagesStrings.product,
                    hasDiscount: true,
                    discountText: '10% Off Discount',
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  // Product Details Section
                  ProductDetailsSection(
                    categoryName: 'Category Name',
                    productName: 'Product name',
                    currentPrice: 'KD12.00',
                    originalPrice: 'KD14.00',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    sellPer: 'Kartoon',
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  // Select Weight Section
                  ProductExpandableSection(
                    title: 'Select weight',
                    options: [
                      {'label': '50 Gram', 'price': '4.00 KD'},
                      {'label': '1 Kg', 'price': '6.25 KD'},
                      {'label': '2 Kg', 'price': '12.00 KD'},
                    ],
                    selectedIndex: selectedWeightIndex,
                    onOptionSelected: (index) {
                      setState(() {
                        selectedWeightIndex = index;
                      });
                    },
                  ),
                  VerticalSpace(height: AppHeight.h12),
                  // Select Addons Section
                  ProductExpandableSection(
                    title: 'Select Addons',
                    options: [
                      {'label': '50 Gram', 'price': '4.00 KD'},
                      {'label': '1 Kg', 'price': '6.25 KD'},
                    ],
                    selectedIndex: selectedAddonIndex,
                    onOptionSelected: (index) {
                      setState(() {
                        selectedAddonIndex = index;
                      });
                    },
                  ),
                  VerticalSpace(height: AppHeight.h16),
                ],
              ),
            ),
          ),
          // Add to Cart Button
          Align(
            alignment: Alignment.bottomRight,
            child: ProductAddToCartButton(
              onPressed: () {
                // Handle add to cart
              },
            ),
          ),
        ],
      ),
    );
  }
}
