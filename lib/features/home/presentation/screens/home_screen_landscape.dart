import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Ensure screenutil is imported for .w/.h
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/core/widget/text_field/custom_text_fiels.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_item.dart';
import 'package:fruits_app/features/home/presentation/widgets/filter_dialog.dart';
import 'package:fruits_app/features/home/presentation/widgets/promo_slider.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_list_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/top_section_heading.dart';

class HomeScreenLandscape extends StatefulWidget {
  const HomeScreenLandscape({super.key});

  @override
  State<HomeScreenLandscape> createState() => _HomeScreenLandscapeState();
}

class _HomeScreenLandscapeState extends State<HomeScreenLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar Area
              Padding(
                padding: EdgeInsets.only(
                  left: 18.w,
                  right: 25.w,
                  top: 22.h,
                  bottom: 11.h,
                ),
                child: CustomInputField(
                  hintText: "What are you looking for ?",
                  fontSize: AppSizes.sp10,
                  heigh: AppHeight.h66,
                ),
              ),

              PromoSlider(height: 200.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 27.w,
                  right: 26.w,
                  bottom: 11.h,
                  top: 15.h,
                ),
                child: SizedBox(
                  height: 170.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index == categories.length - 1 ? 0 : 40.w,
                          left: index == 0 ? 0 : 10.w,
                        ),
                        child: Row(
                          children: [
                            CategoryItem(imagePath: category['image']!),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Sellers Heading and Filter
              Padding(
                padding: EdgeInsets.only(left: 13.w, right: 9.w, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopSectionHeading(),
                    IconButton(
                      onPressed: () {
                        filterDialogLandscape(context);
                      },
                      icon: Image.asset(
                        AppImagesStrings.categoryAppBar,
                        width: AppWidth.w20,
                      ),
                    ),
                  ],
                ),
              ),

              // Sellers List
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: SellerListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
