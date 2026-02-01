import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_desktop.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_mobile.dart';
import 'package:fruits_app/features/product/presentation/screen/product_screen_tablet.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      
      body: AdaptiveLayout(
        mobileLayout: ProductScreenMobile(product: product),
        tabletLayout: ProductScreenTablet(product: product),
        desktopLayout: ProductScreenDesktop(product: product),
      ),
    );
  }
}
