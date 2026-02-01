import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/Di/service_locator.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:fruits_app/features/seller/presentation/screen/seller_screen_desktop.dart';
import 'package:fruits_app/features/seller/presentation/screen/seller_screen_mobile.dart';
import 'package:fruits_app/features/seller/presentation/screen/seller_screen_tablet.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({super.key});
  static const String routeName = '/seller';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductCubit>()..getProducts(),
      child: AdaptiveLayout(
        mobileLayout: const SellerScreenMobile(),
        tabletLayout: const SellerScreenTablet(),
        desktopLayout: const SellerScreenDesktop(),
      ),
    );
  }
}
