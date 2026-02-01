import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:fruits_app/features/product/presentation/cubit/product_state.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class SellerProductsSection extends StatelessWidget {
  const SellerProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Products',
              style: AppTextTheme.lightTextTheme.labelMedium?.copyWith(
                fontSize: AppSizes.sp19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(AppImagesStrings.format),
          ],
        ),
        VerticalSpace(height: AppHeight.h12),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Text(state.message);
            } else if (state is ProductLoaded) {
              return Column(
                children: state.products
                    .map(
                      (product) => Column(
                        children: [
                          SellerProductListItem(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductScreen.routeName,
                                arguments: product,
                              );
                            },
                            productName: product.nameEn,
                            currentPrice: '${product.price} KD',
                            originalPrice: null,
                            hasDiscount: false,
                          ),
                          VerticalSpace(height: AppHeight.h12),
                        ],
                      ),
                    )
                    .toList(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
