import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_section.dart';
import 'package:fruits_app/features/home/presentation/widgets/filter_dialog.dart';
import 'package:fruits_app/features/home/presentation/widgets/promo_slider.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_list_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/top_section_heading.dart';

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: null,
        automaticallyImplyLeading: false,
        title: Text(
          AppTextStrings.fruitMarket,
          style: textTheme.headlineLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontSize: AppSizes.sp28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppImagesStrings.searchIcon, width: 30),
          ),
          IconButton(
            onPressed: () {
              filterDialogPortreit(context);
            },
            icon: Image.asset(AppImagesStrings.categoryAppBar, width: 30),
          ),
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: AppColors.homebackground,
      body: SafeArea(
        child: Row(
          children: [
            // Main content
            Expanded(
              flex: 3,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  VerticalSpace(height: 16),
                  const RepaintBoundary(child: PromoSlider()),
                  VerticalSpace(height: 20),
                  RepaintBoundary(child: CategorySection()),
                  VerticalSpace(height: 24),
                  TopSectionHeading(),
                  VerticalSpace(height: 12),
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
