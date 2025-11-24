import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/utils/constant/dummy_data.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/features/auth/modules/welcome/presentation/screen/welcome_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/indactor.dart';
import 'package:fruits_app/features/onboarding/presentation/widget/skip_button.dart';

class OnboardingScreenDesktop extends StatefulWidget {
  const OnboardingScreenDesktop({super.key});

  @override
  State<OnboardingScreenDesktop> createState() =>
      _OnboardingScreenDesktopState();
}

class _OnboardingScreenDesktopState extends State<OnboardingScreenDesktop> {
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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 37.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SkipButton(onPressed: _onSkip),
                  ),
                ),
                Flexible(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (i) => setState(() => _currentIndex = i),
                    itemBuilder: (_, i) {
                      final p = pages[i];
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: IntrinsicHeight(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                  ),
                                  child: Column(
                                    children: [
                                      const Spacer(),
                                      SvgPicture.asset(
                                        p.imagePath,
                                        width: 285.0,
                                        height: 273.0,
                                        fit: BoxFit.fill,
                                      ),
                                      const VerticalSpace(height: 24.0),
                                      Text(
                                        p.title,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineLarge,
                                      ),
                                      const VerticalSpace(height: 17.0),
                                      Text(
                                        p.subtitle,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                      ),
                                      const Spacer(),
                                      Indicators(
                                        current: _currentIndex,
                                        count: pages.length,
                                        activeColor: AppColors.primaryGreen,
                                      ),
                                      const Spacer(),
                                      PrimaryButton(
                                        label: _currentIndex == pages.length - 1
                                            ? AppTextStrings.getStarted
                                            : AppTextStrings.next,
                                        color: AppColors.primaryGreen,
                                        onPressed: _onNext,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
