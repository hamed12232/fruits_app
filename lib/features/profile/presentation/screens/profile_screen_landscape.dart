import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/routes/app_route.dart';
import 'package:fruits_app/features/profile/presentation/widgets/language_dialog.dart';
import 'package:fruits_app/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreenLandscape extends StatelessWidget {
  const ProfileScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            // Left Side: User Info
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.homebackground,
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppWidth.w80, // Reduced from mobile
                      height: AppHeight.h80, // Reduced from mobile
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.greyTextColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImagesStrings.user,
                          width: AppSizes.sp30, // Reduced
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    VerticalSpace(height: AppHeight.h10),
                    Text(
                      AppTextStrings.welcomeFruitMarket,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.black,
                            fontSize: AppSizes.sp16, // Reduced
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpace(height: AppHeight.h30),
                  ],
                ),
              ),
            ),

            // Right Side: Menu Items
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w24,
                  vertical: AppHeight.h20,
                ),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      title: AppTextStrings.profile,
                      iconPath: AppImagesStrings.user,
                      iconHeight: AppHeight.h24,
                      iconWidth: AppWidth.w24,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.editProfile);
                      },
                    ),
                    ProfileMenuItem(
                      title: AppTextStrings.myOrders,
                      iconPath: AppImagesStrings.categoryIcon,
                      iconHeight: AppHeight.h24,
                      iconWidth: AppWidth.w24,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.navigationScreen,
                          arguments: 1,
                        );
                      },
                    ),
                    ProfileMenuItem(
                      title: AppTextStrings.favorite,
                      iconPath: AppImagesStrings.favoriteIcon,
                      iconHeight: AppHeight.h24,
                      iconWidth: AppWidth.w24,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.navigationScreen,
                          arguments: 3,
                        );
                      },
                    ),
                    ProfileMenuItem(
                      title: AppTextStrings.language,
                      iconPath: AppImagesStrings.languages,
                      iconHeight: AppHeight.h24,
                      iconWidth: AppWidth.w24,
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
                      iconHeight: AppHeight.h24,
                      iconWidth: AppWidth.w24,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.contactUs);
                      },
                    ),
                    ProfileMenuItem(
                      title: AppTextStrings.termsAndConditions,
                      iconPath: AppImagesStrings.money,
                      iconHeight: AppHeight.h24,
                      iconWidth: AppWidth.w24,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.termsAndConditions,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
