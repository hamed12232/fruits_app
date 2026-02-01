import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/success/success_operation.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_state.dart';
import 'package:fruits_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_app/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_payment_screen.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_screen.dart';
import 'package:fruits_app/features/checkout/presentation/widget/successfully_view.dart';
import 'package:fruits_app/features/orders/presentation/cubit/order_cubit.dart';

class CheckoutMainScreen extends StatefulWidget {
  const CheckoutMainScreen({super.key});
  static const String routeName = '/checkout_main';

  @override
  State<CheckoutMainScreen> createState() => _CheckoutMainScreenState();
}

class _CheckoutMainScreenState extends State<CheckoutMainScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<Widget> steps = [
    const CheckoutScreen(),
    const CheckoutScreen(
      isDeliveryAddress: true,
      isDeliveryTime: false,
      index: 1,
    ),
    const CheckoutPaymentScreen(index: 2),
  ];

  void goNext() {
    if (currentIndex < steps.length - 1) {
      setState(() => currentIndex++);
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void goBack() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          Navigator.pushNamed(
            context,
            isLandscape
                ? SuccessfullyView.routeName
                : SuccessOperation.routeName,
          );
          // Also fetch orders to update history
          context.read<OrderCubit>().fetchOrders();
          // Optionally clear cart
        } else if (state is CheckoutError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(height: 1, color: Colors.black.withOpacity(0.1)),
          ),
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () =>
                currentIndex == 0 ? Navigator.pop(context) : goBack(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
              size: AppWidth.w24,
            ),
          ),
          centerTitle: true,
          title: Text(
            AppTextStrings.checkout,
            style: AppTextTheme.lightTextTheme.headlineLarge?.copyWith(
              color: AppColors.primaryGreen,
              fontSize: AppSizes.sp24,
            ),
          ),
        ),
        body: isLandscape ? _buildLandscapeBody() : _buildPortraitBody(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: PrimaryButton(
            label: currentIndex == steps.length - 1
                ? "Place Order"
                : "Continue",
            width: double.infinity,
            onPressed: () {
              if (currentIndex == steps.length - 1) {
                final cartState = context.read<CartCubit>().state;
                if (cartState is CartLoaded) {
                  context.read<CheckoutCubit>().placeOrder(
                    items: cartState.items,
                    totalPrice: cartState.total.toDouble(),
                  );
                }
              } else {
                goNext();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitBody() {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: steps,
      onPageChanged: (index) {
        setState(() => currentIndex = index);
      },
    );
  }

  Widget _buildLandscapeBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: steps,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
