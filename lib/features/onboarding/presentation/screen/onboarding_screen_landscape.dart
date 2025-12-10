import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_sizes.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/indactor.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/skip_button.dart';

class OnboardingScreenLandscape extends StatefulWidget {
  const OnboardingScreenLandscape({super.key});

  @override
  State<OnboardingScreenLandscape> createState() =>
      _OnboardingScreenLandscapeState();
}

class _OnboardingScreenLandscapeState extends State<OnboardingScreenLandscape> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onSkip() {
    Navigator.of(context).pushNamed(WelcomeScreen.routeName);
  }

  void _onNext() {
    if (_currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  void _finish() {
    Navigator.of(context).pushNamed(WelcomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Left side - Image
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (_, i) {
                  return Center(
                    child: SvgPicture.asset(
                      pages[i].imagePath,
                      width: 200.w, // Reduced size for landscape
                      height: 200.h,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            // Right side - Content
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: _currentIndex != pages.length - 1
                          ? SkipButton(onPressed: _onSkip, fontSize: AppSizes.sp10)
                          : SizedBox.shrink(),
                    ),
                    const Spacer(),
                    Text(
                      pages[_currentIndex].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontSize: AppSizes.sp14, // Reduced font size
                          ),
                    ),
                    VerticalSpace(height: 16.h),
                    Text(
                      pages[_currentIndex].subtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontSize: AppSizes.sp10, // Reduced font size
                          ),
                    ),
                    VerticalSpace(height: 40.h),
                    Indicators(
                      current: _currentIndex,
                      count: pages.length,
                      activeColor: AppColors.primaryGreen,
                      height: AppBorderRadius.r15d,
                      width: AppBorderRadius.r15d,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      label: _currentIndex == pages.length - 1
                          ? AppTextStrings.getStarted
                          : AppTextStrings.next,
                      color: AppColors.primaryGreen,
                      onPressed: _onNext,
                      fontSize: AppSizes.sp10, // Reduced font size
                    
                      width: double.infinity,
                    ),
                    VerticalSpace(height: 20.h),
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
