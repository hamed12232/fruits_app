import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_section.dart';
import 'package:fruits_app/features/home/presentation/widgets/filter_dialog.dart';
import 'package:fruits_app/features/home/presentation/widgets/promo_slider.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_list_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/top_section_heading.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      body: SafeArea(
        child: Column(
          children: [
            // Desktop AppBar
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              child: Row(
                children: [
                  Text(
                    AppTextStrings.fruitMarket,
                    style: textTheme.headlineLarge?.copyWith(
                      color: AppColors.primaryGreen,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(AppImagesStrings.searchIcon, width: 32),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      filterDialogPortreit(context);
                    },
                    icon: Image.asset(
                      AppImagesStrings.categoryAppBar,
                      width: 32,
                    ),
                  ),
                ],
              ),
            ),
            // Main content - same order as mobile
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 32,
                ),
                children: [
                  // 1. Promo Slider
                  const RepaintBoundary(child: PromoSlider()),
                  const VerticalSpace(height: 40),

                  // 2. Categories Section
                  Text(
                    'Categories',
                    style: textTheme.headlineMedium?.copyWith(
                      color: AppColors.primaryGreen,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpace(height: 20),
                  const CategorySection(),
                  const VerticalSpace(height: 40),

                  // 3. Sellers Heading
                  const TopSectionHeading(),
                  const VerticalSpace(height: 24),

                  // 4. Sellers List
                  const SellerListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
