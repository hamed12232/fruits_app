import 'package:flutter/material.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/routes/app_route.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/profile/presentation/widgets/language_dialog.dart';
import 'package:fruits_app/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreenDesktop extends StatelessWidget {
  const ProfileScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppTextStrings.fruitMarket),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.all(48),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Profile info
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.greyTextColor,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImagesStrings.user,
                          width: 50,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 24),
                    Text(
                      AppTextStrings.welcomeFruitMarket,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const VerticalSpace(height: 48),
                    SizedBox(
                      width: 250,
                      child: PrimaryButton(
                        label: AppTextStrings.login,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 48),
              // Right side - Menu items
              Expanded(
                child: Column(
                  children: [
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
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.orders);
                      },
                    ),
                    ProfileMenuItem(
                      title: AppTextStrings.favorite,
                      iconPath: AppImagesStrings.favoriteIcon,
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
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.termsAndConditions,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
