import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/indactor.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onSkip() {
    _pageController.animateToPage(
      pages.length - 1,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  void _onNext() {
    if (_currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _finish();
    }
  }

  void _finish() {
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.h, right: 36.w),
              child: Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: _onSkip,
                    child: Text(
                      'Skip',
                      
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (_, i) {
                  final p = pages[i];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        VerticalSpace(height: 61.h),                    
                        SvgPicture.asset(
                          p.imagePath,
                          width: 285.w,
                          height: 273.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          p.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 17.h),
                        Text(
                          p.subtitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 53.h),
                        Indicators(
                          current: _currentIndex,
                          count: pages.length,
                          activeColor: AppColors.primaryGreen,
                        ),
                        SizedBox(height: 87.h),
                        PrimaryButton(
                          label: _currentIndex == pages.length - 1
                              ? 'Get Started'
                              : 'Next',
                          color: AppColors.primaryGreen,
                          onPressed: _onNext,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
