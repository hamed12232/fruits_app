import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_state.dart';
import 'package:fruits_app/features/basket/presentation/widget/basket_summary_section.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_main_screen.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item.dart';

class BasketScreenMobile extends StatelessWidget {
  const BasketScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(
        title: AppTextStrings.basket,
        showBackButton: false,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return Center(child: Text('Your basket is empty'));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppWidth.w16,
                      vertical: AppHeight.h16,
                    ),
                    itemCount: state.items.length,
                    separatorBuilder: (context, index) =>
                        VerticalSpace(height: AppHeight.h16),
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return SellerProductListItem(
                        productName: item.product.nameEn,
                        currentPrice: '${item.product.price} KD',
                        hasDiscount: false,
                        isBasket: true,
                        quantity: item.quantity,
                        onDelete: () {
                          context.read<CartCubit>().removeFromCart(item);
                        },
                        onIncrement: () {
                          context.read<CartCubit>().incrementQuantity(item);
                        },
                        onDecrement: () {
                          context.read<CartCubit>().decrementQuantity(item);
                        },
                      );
                    },
                  ),
                ),
                BasketSummarySection(
                  subtotal: state.subtotal.toDouble(),
                  shippingCharges: state.shipping.toDouble(),
                  itemCount: state.items.length,
                  onCheckout: () {
                    Navigator.pushNamed(context, CheckoutMainScreen.routeName);
                  },
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
