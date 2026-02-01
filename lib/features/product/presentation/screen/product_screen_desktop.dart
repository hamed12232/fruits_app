import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';
import 'package:fruits_app/features/product/presentation/widget/product_add_to_cart_button.dart';
import 'package:fruits_app/features/product/presentation/widget/product_details_section.dart';
import 'package:fruits_app/features/product/presentation/widget/product_image_card.dart';

class ProductScreenDesktop extends StatelessWidget {
  final ProductEntity product;
  const ProductScreenDesktop({super.key, required this.product});

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
          product.nameEn,
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
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Image
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: ProductImageCard(
                    imagePath: AppImagesStrings.product,
                    hasDiscount: false, // Update logic if needed
                    discountText: '',
                  ),
                ),
              ),
              // Right side - Details
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailsSection(
                        categoryName: 'Fresh Fruits',
                        productName: product.nameEn,
                        currentPrice: '${product.price} KD',
                        originalPrice: null,
                        description: product.detailsEn,
                        sellPer: '${product.quantity} Unit',
                      ),
                      VerticalSpace(height: 24),
                      // Removed hardcoded expandable
                      VerticalSpace(height: 16),
                      // Removed hardcoded expandable
                      VerticalSpace(height: 32),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ProductAddToCartButton(
                          onPressed: () {
                            context.read<CartCubit>().addToCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${product.nameEn} added to cart',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
