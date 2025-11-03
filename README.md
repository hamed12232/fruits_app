# Fruits App – Splash & Onboarding Implementation

This document summarizes all changes made to add the Splash screen and the three-page Onboarding flow, along with setup, assets, and usage instructions.

## Overview
- Added a branded Splash screen with layered artwork (background + logo + bottom fruits image).
- Implemented a 3-step Onboarding flow with `PageView`, page indicators, and actions: Skip, Next, and Get Started.
- Integrated `flutter_screenutil` across screens for responsive sizing.

## Tech & Packages
- `flutter_screenutil`: for responsive sizes (Sp, W, H, R). Design size used in `main.dart` is `(430, 932)`.
- `flutter_svg`: to render SVG assets in Splash/Onboarding.

## File Changes

### Created
- `lib/features/onboarding/presentation/screen/onboarding_screen.dart`
  - Stateful screen with `PageController` and 3 pages defined in `pages` (from `core/utils/constant/dummy_data.dart`).
  - Uses:
    - `Indicators` widget (`lib/features/onboarding/presentation/widget/indactor.dart`).
    - `PrimaryButton` (`lib/core/widget/button/primary_button.dart`).
    - `AppColors` (`lib/core/utils/constant/app_colors.dart`).
    - `VerticalSpace` (`lib/core/style/spacing/vertical_space.dart`).
- (Pre-existing but updated) `lib/features/splash_screen/presentation/screen/spalsh_screen.dart`
  - Stack-based layout:
    - Background SVG (`AppImagesStrings.backgroundSplashImage`).
    - Center brand image (`AppImagesStrings.fruitMarketImage`).
    - Bottom fruits artwork pinned to bottom and full width (`AppImagesStrings.fruitsImage`).

### Modified
- `lib/main.dart`
  - Starts app within `ScreenUtilInit` and points `home` to your chosen initial screen (`SpalshScreen` currently).

> Note: Your project already contains several core utilities and widgets used by the onboarding screen. This README assumes they exist as in your current tree:
> - `core/style/spacing/vertical_space.dart`
> - `core/utils/constant/app_colors.dart`
> - `core/utils/constant/dummy_data.dart` (provides `pages` list: title, subtitle, imagePath)
> - `core/widget/button/primary_button.dart`
> - `features/onboarding/presentation/widget/indactor.dart`

## Assets
Ensure these assets exist and are declared in `pubspec.yaml`:

Splash
- `AppImagesStrings.backgroundSplashImage` → SVG background (e.g. `assets/images/splash_bg.svg`)
- `AppImagesStrings.fruitMarketImage` → brand image (PNG/SVG)
- `AppImagesStrings.fruitsImage` → bottom fruits artwork (PNG/SVG)

Onboarding (examples; you can map to your constants or use the provided dummy paths):
- `assets/images/onboarding_1.svg`
- `assets/images/onboarding_2.svg`
- `assets/images/onboarding_3.svg`

### pubspec.yaml
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```
After editing, run:
```bash
flutter pub get
```

## Splash Screen Details
- File: `lib/features/splash_screen/presentation/screen/spalsh_screen.dart`
- Layout: `Stack` with three layers
  1) Fullscreen `SvgPicture.asset(AppImagesStrings.backgroundSplashImage)`
  2) `Positioned(top: 221.h, child: Image.asset(AppImagesStrings.fruitMarketImage))`
  3) Bottom fruits image pinned to screen bottom and full width:
     ```dart
     Positioned(
       bottom: 0,
       left: 0,
       right: 0,
       child: Image.asset(
         AppImagesStrings.fruitsImage,
         fit: BoxFit.fill,
       ),
     )
     ```
- Optional timer/navigation can be added in `initState` to automatically move to Onboarding or Home.

## Onboarding Screen Details
- File: `lib/features/onboarding/presentation/screen/onboarding_screen.dart`
- Uses a `PageView.builder` over `pages` (from `dummy_data.dart`). Each page renders:
  - Illustration (SVG)
  - Title and subtitle (uses theme text styles)
  - Page indicators (`Indicators` widget)
  - Primary CTA (`PrimaryButton`) that shows `Next` or `Get Started` on last page
- Actions:
  - Skip: jumps to last page
  - Next: advances to next page; on last page it calls `_finish()`
  - `_finish()`: currently calls `Navigator.of(context).maybePop()`; replace with navigation to your Home/Sign-in route.

### Hooking Up Navigation
- Start at Splash (current): `main.dart` child is `SpalshScreen()`
- From Splash → Onboarding:
  ```dart
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const OnboardingScreen()),
  );
  ```
- From Onboarding (Get Started) → target screen (e.g., Home):
  ```dart
  void _finish() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
  ```

## Theming & Sizing
- `flutter_screenutil` is initialized with `designSize: Size(430, 932)` in `main.dart`.
- Use `.w`, `.h`, `.sp`, `.r` for sizing so UI matches different screens.
- Primary brand color used across onboarding: `AppColors.primaryGreen`.

## Troubleshooting
- SVG not visible: ensure `flutter_svg` is in `pubspec.yaml` and asset path is correct; some SVGs require `allowDrawingOutsideViewBox: true` or need a proper viewBox.
- Asset not found: confirm path case-sensitivity and that it’s under an included folder in `pubspec.yaml`.
- Layout shifts on different devices: verify `ScreenUtilInit` wraps `MaterialApp` and you use responsive units.

## Next Steps
- Replace dummy onboarding SVG paths with your actual assets or wire to your constants.
- Customize `_finish()` to navigate to your real entry screen.
- Optionally persist onboarding completion (e.g., using `shared_preferences`) to skip onboarding next app launch.

# fruits_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
