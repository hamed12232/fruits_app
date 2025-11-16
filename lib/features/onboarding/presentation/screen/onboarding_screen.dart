import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/indactor.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static final String routeName = '/onBoarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppHeight.h18, right: AppWidth.w37),
              child: SkipButton(onPressed: _onSkip),
            ),
            Flexible(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (_, i) {
                  final p = pages[i];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                    child: Column(
                      children: [
                        VerticalSpace(height: AppHeight.h61),
                        SvgPicture.asset(
                          p.imagePath,
                          width: AppWidth.w285,
                          height: AppHeight.h273,
                          fit: BoxFit.fill,
                        ),
                        VerticalSpace(height: AppHeight.h24),
                        Text(
                          p.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        VerticalSpace(height: AppHeight.h17),
                        Text(
                          p.subtitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        VerticalSpace(height: AppHeight.h53),
                        Indicators(
                          current: _currentIndex,
                          count: pages.length,
                          activeColor: AppColors.primaryGreen,
                        ),
                        VerticalSpace(height: AppHeight.h87),
                        PrimaryButton(
                          label: _currentIndex == pages.length - 1
                              ? AppTextStrings.getStarted
                              : AppTextStrings.next,
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
