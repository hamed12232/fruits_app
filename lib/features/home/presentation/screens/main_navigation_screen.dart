import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/features/basket/presentation/screen/basket_screen.dart';
import 'package:fruits_app/features/favourite/presentation/screen/favorite_screen.dart';
import 'package:fruits_app/features/home/presentation/screens/home_screen.dart';
import 'package:fruits_app/features/orders/presentation/screen/orders_screen.dart';
import 'package:fruits_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScreen({super.key, this.initialIndex = 0});

  static const routeName = '/main-navigation';
  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int index;
  final List<Widget> _pages = const [
    HomeScreen(),
    OrdersScreen(),
    BasketScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

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
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final navBarHeight = isLandscape ? AppHeight.h87 : AppHeight.h68;
    final navFontSize = isLandscape ? AppSizes.sp17 : AppSizes.sp15;
    final iconSide = isLandscape ? AppWidth.w40 : AppWidth.w31;
    final navPadding = EdgeInsets.only(
      left: isLandscape ? AppWidth.w16 : AppWidth.w11,
      right: isLandscape ? AppWidth.w16 : AppWidth.w11,
      top: isLandscape ? AppHeight.h12 : AppHeight.h8,
      bottom: isLandscape ? AppHeight.h12 : AppHeight.h8,
    );

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: navBarHeight,
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
                fontSize: navFontSize,
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
              padding: navPadding,
              tabs: [
                GButton(
                  leading: Image.asset(
                    AppImagesStrings.homeIcon,
                    color: index == 0
                        ? AppColors.primaryGreen
                        : AppColors.white,
                  height: isLandscape?null:25,
                  width: isLandscape?null:25,
                  
                  ),
                  icon: Icons.home,
                  iconSize: iconSide,
                  iconColor: AppColors.primaryGreen,
                  text: 'Home',
                ),
                GButton(
                  leading: Image.asset(
                    AppImagesStrings.categoryIcon,
                    color: index == 1
                        ? AppColors.primaryGreen
                        : AppColors.white,
                          height: isLandscape?null:25,
                  width: isLandscape?null:25,
                  
                  ),
                  icon: Icons.home,
                  iconSize: iconSide,
                  text: 'Orders',
                ),
                GButton(
                  leading: Image.asset(
                    AppImagesStrings.cartIcon,
                    color: index == 2
                        ? AppColors.primaryGreen
                        : AppColors.white,
                          height: isLandscape?null:25,
                  width: isLandscape?null:25,
                  
                  ),
                  icon: Icons.home,
                  iconSize: iconSide,
                  text: 'Basket',
                ),
                GButton(
                  leading: Image.asset(
                    AppImagesStrings.favoriteIcon,
                    color: index == 3
                        ? AppColors.primaryGreen
                        : AppColors.white,
                          height: isLandscape?null:25,
                  width: isLandscape?null:25,
                  
                  ),
                  icon: Icons.home,
                  iconSize: iconSide,
                  text: 'Favorite',
                ),
                GButton(
                  leading: Image.asset(
                    AppImagesStrings.moreIcon,
                    color: index == 4
                        ? AppColors.primaryGreen
                        : AppColors.white,
                          height: isLandscape?null:25,
                  width: isLandscape?null:25,
                
                  ),
                  icon: Icons.home,
                  iconSize: iconSide,
                  text: 'More',
                ),
              ],
            ),
          ),
        ),
        body: _pages[index],
      ),
    );
  }
}
