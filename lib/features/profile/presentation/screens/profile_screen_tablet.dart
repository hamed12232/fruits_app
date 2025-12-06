import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/routes/app_route.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/profile/presentation/widgets/language_dialog.dart';
import 'package:fruits_app/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreenTablet extends StatelessWidget {
  const ProfileScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: AppTextStrings.fruitMarket,
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w20),
        child: Column(
          children: [
            VerticalSpace(height: AppHeight.h30),
            Container(
              width: AppSizes.sp100,
              height: AppSizes.sp100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greyTextColor, width: 1),
              ),
              child: Center(
                child: Image.asset(
                  AppImagesStrings.user,
                  width: AppSizes.sp40,
                  color: AppColors.greyTextColor,
                ),
              ),
            ),
            VerticalSpace(height: AppHeight.h16),
            Text(
              AppTextStrings.welcomeFruitMarket,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.black,
                fontSize: AppSizes.sp18,
                fontWeight: FontWeight.w500,
              ),
            ),
            VerticalSpace(height: AppHeight.h30),
            ProfileMenuItem(
              title: AppTextStrings.profile,
              iconPath: AppImagesStrings.user,
              onTap: () {
                Navigator.pushNamed(context, AppRoutesName.editProfile);
              },
            ),
            ProfileMenuItem(
              title: AppTextStrings.myOrders,
              iconPath: AppImagesStrings.categoryIcon,
              iconHeight: AppHeight.h30,
              iconWidth: AppWidth.w29,
              onTap: () {
                Navigator.pushNamed(context, AppRoutesName.orders);
              },
            ),
            ProfileMenuItem(
              title: AppTextStrings.favorite,
              iconPath: AppImagesStrings.favoriteIcon,
              iconHeight: AppHeight.h30,
              iconWidth: AppWidth.w29,
              onTap: () {
                Navigator.pushNamed(context, AppRoutesName.favorite);
              },
            ),
            ProfileMenuItem(
              title: AppTextStrings.language,
              iconPath: AppImagesStrings.languages,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const LanguageDialog(),
                );
              },
            ),
            ProfileMenuItem(
              title: AppTextStrings.support,
              iconPath: AppImagesStrings.headphone,
              onTap: () {
                Navigator.pushNamed(context, AppRoutesName.contactUs);
              },
            ),
            ProfileMenuItem(
              title: AppTextStrings.termsAndConditions,
              iconPath: AppImagesStrings.money,
              onTap: () {
                Navigator.pushNamed(context, AppRoutesName.termsAndConditions);
              },
            ),
            VerticalSpace(height: AppHeight.h30),
            PrimaryButton(label: AppTextStrings.login, onPressed: () {}),
            VerticalSpace(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
