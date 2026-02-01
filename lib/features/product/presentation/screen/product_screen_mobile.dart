import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/favourite/presentation/cubit/favorite_cubit.dart';
import 'package:fruits_app/features/favourite/presentation/cubit/favorite_state.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';
import 'package:fruits_app/features/product/presentation/widget/product_add_to_cart_button.dart';
import 'package:fruits_app/features/product/presentation/widget/product_details_section.dart';
import 'package:fruits_app/features/product/presentation/widget/product_image_card.dart';

class ProductScreenMobile extends StatelessWidget {
  final ProductEntity product;
  const ProductScreenMobile({super.key, required this.product});

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
            size: AppWidth.w24,
          ),
        ),
        centerTitle: true,
        title: Text(
          product.nameEn,
          style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: AppSizes.sp24,
          ),
        ),
        actions: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              final isFavorite = context.read<FavoriteCubit>().isFavorite(
                product,
              );
              return GestureDetector(
                onTap: () {
                  context.read<FavoriteCubit>().toggleFavorite(product);
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : AppColors.black,
                  size: AppWidth.w32,
                ),
              );
            },
          ),
          SizedBox(width: AppWidth.w16),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.share,
              color: AppColors.black,
              size: AppWidth.w24,
            ),
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
                  ProductImageCard(
                    imagePath: AppImagesStrings.product,
                    hasDiscount: false, // Update logic if needed
                    discountText: '',
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  ProductDetailsSection(
                    categoryName: 'Fresh Fruits', // Needs category info
                    productName: product.nameEn,
                    currentPrice: '${product.price} KD',
                    originalPrice: null, // Update if available
                    description: product.detailsEn,
                    sellPer: '${product.quantity} Unit', // Adjust unit logic
                  ),
                  VerticalSpace(height: AppHeight.h16),
                  // Removed hardcoded expandable sections for now as they might not be in entity
                  // Or we can keep them if they are static for all products
                  VerticalSpace(height: AppHeight.h16),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ProductAddToCartButton(
              onPressed: () {
                context.read<CartCubit>().addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.nameEn} added to cart'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
