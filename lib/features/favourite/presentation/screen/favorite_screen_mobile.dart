import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/favourite/presentation/cubit/favorite_cubit.dart';
import 'package:fruits_app/features/favourite/presentation/cubit/favorite_state.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class FavoriteScreenMobile extends StatelessWidget {
  const FavoriteScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(
        title: AppTextStrings.favorite,
        showBackButton: false,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoaded) {
            if (state.favorites.isEmpty) {
              return Center(child: Text('No favorites yet'));
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: AppWidth.w16,
                vertical: AppHeight.h16,
              ),
              itemCount: state.favorites.length,
              separatorBuilder: (context, index) =>
                  VerticalSpace(height: AppHeight.h16),
              itemBuilder: (context, index) {
                final product = state.favorites[index];
                return SellerProductListItem(
                  productName: product.nameEn,
                  currentPrice: '${product.price} KD',
                  hasDiscount: false, // Update if needed
                  isFavorite: true,
                  storeName: 'Store Name', // Update if needed
                  onDelete: () {
                    context.read<FavoriteCubit>().toggleFavorite(product);
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
