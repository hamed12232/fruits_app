import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/Di/service_locator.dart';
import 'package:fruits_app/core/widget/adaptive_layout/adaptive_layout.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_desktop.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_landscape.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_mobile.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen_tablet.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});
  static const String routeName = '/basket';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CartCubit>(),
      child: AdaptiveLayout(
        mobileLayout: OrientationBuilder(
          builder: (context, orientation) =>
              orientation == Orientation.landscape
              ? const BasketScreenLandscape()
              : const BasketScreenMobile(),
        ),
        tabletLayout: OrientationBuilder(
          builder: (context, orientation) =>
              orientation == Orientation.landscape
              ? const BasketScreenLandscape()
              : const BasketScreenTablet(),
        ),
        desktopLayout: const BasketScreenDesktop(),
      ),
    );
  }
}
