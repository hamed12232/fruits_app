import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen.dart';
import 'package:fruits_app/features/orders/presentation/screen/orders_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});
  static const routeName = '/main-navigation';
  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int index = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    OrdersScreen(),
    BasketScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages(); // safe here
  }

  Future<void> _precacheImages() async {
    final imagePaths = [
      AppImagesStrings.homeIcon,
      AppImagesStrings.categoryIcon,
      AppImagesStrings.cartIcon,
      AppImagesStrings.favoriteIcon,
      AppImagesStrings.moreIcon,
    ];

    for (final path in imagePaths) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: AppHeight.h68,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorderRadius.r20),
            topRight: Radius.circular(AppBorderRadius.r20),
          ),
          child: GNav(
            selectedIndex: index,
            onTabChange: (value) {
              setState(() {
                index = value;
              });
            },
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            tabBorderRadius: AppSizes.r30,
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontSize: AppSizes.sp15,
              fontWeight: FontWeight.bold,
            ),
            tabActiveBorder: Border.all(
              color: AppColors.primaryGreen,
              width: AppWidth.w6,
            ),
            backgroundColor: AppColors.primaryGreen,
            tabBackgroundColor: AppColors.white,
            color: AppColors.white,
            activeColor: AppColors.primaryGreen,
            padding: EdgeInsets.only(
              left: AppWidth.w11,
              right: AppWidth.w11,
              top: AppHeight.h8,
              bottom: AppHeight.h8,
            ),
            tabs: [
              GButton(
                leading: Image.asset(
                  AppImagesStrings.homeIcon,
                  color: index == 0 ? AppColors.primaryGreen : AppColors.white,
                  width: AppWidth.w31,
                  height: AppHeight.h30,
                ),
                icon: Icons.home,
                iconColor: AppColors.primaryGreen,
                text: 'Home',
              ),
              GButton(
                leading: Image.asset(
                  AppImagesStrings.categoryIcon,
                  color: index == 1 ? AppColors.primaryGreen : AppColors.white,
                  width: AppWidth.w31,
                  height: AppHeight.h30,
                ),
                icon: Icons.home,
                text: 'Orders',
              ),
              GButton(
                leading: Image.asset(
                  AppImagesStrings.cartIcon,
                  color: index == 2 ? AppColors.primaryGreen : AppColors.white,
                  width: AppWidth.w31,
                  height: AppHeight.h30,
                ),
                icon: Icons.home,
                text: 'Basket',
              ),
              GButton(
                leading: Image.asset(
                  AppImagesStrings.favoriteIcon,
                  color: index == 3 ? AppColors.primaryGreen : AppColors.white,
                  width: AppWidth.w31,
                  height: AppHeight.h30,
                ),
                icon: Icons.home,
                text: 'Favorite',
              ),
              GButton(
                leading: Image.asset(
                  AppImagesStrings.moreIcon,
                  color: index == 4 ? AppColors.primaryGreen : AppColors.white,
                  width: AppWidth.w31,
                  height: AppHeight.h30,
                ),
                icon: Icons.home,
                text: 'More',
              ),
            ],
          ),
        ),
      ),
      body: _pages[index],
    );
  }
}
