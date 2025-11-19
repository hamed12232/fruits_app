import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/success/success_operation.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_payment_screen.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.black.withOpacity(0.1), // خط خفيف تحت الـ AppBar
          ),
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

      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: steps,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: PrimaryButton(
          label: currentIndex == steps.length - 1 ? "Place Order" : "Continue",
          width: double.infinity,
          onPressed: () {
            if (currentIndex == steps.length - 1) {
              Navigator.pushNamed(context, SuccessOperation.routeName);
            } else {
              goNext();
            }
          },
        ),
      ),
    );
  }
}
