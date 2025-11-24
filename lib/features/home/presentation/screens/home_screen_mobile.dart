import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_section.dart';
import 'package:fruits_app/features/home/presentation/widgets/filter_dialog.dart';
import 'package:fruits_app/features/home/presentation/widgets/promo_slider.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_list_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/top_section_heading.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

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
            fontSize: AppSizes.sp24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppImagesStrings.searchIcon, width: AppWidth.w25),
          ),
          IconButton(
            onPressed: () {
              filterDialogPortreit(context);
            },
            icon: Image.asset(
              AppImagesStrings.categoryAppBar,
              width: AppWidth.w25,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.homebackground,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            VerticalSpace(height: AppHeight.h8),
            const RepaintBoundary(child: PromoSlider()),
            VerticalSpace(height: AppHeight.h14),
            RepaintBoundary(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
                child: CategorySection(),
              ),
            ),
            VerticalSpace(height: AppHeight.h16),
            TopSectionHeading(),
            VerticalSpace(height: AppHeight.h8),
            const SellerListView(),
          ],
        ),
      ),
    );
  }
}
