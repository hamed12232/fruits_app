# Fruits App – Splash, Onboarding & Auth Implementation

This document summarizes all changes made to add the Splash screen, three-page Onboarding flow, and a complete authentication module (Welcome, Sign-in, Sign-up, Phone Verification, OTP), along with setup, assets, and usage instructions.

## Overview
- Added a branded Splash screen with layered artwork (background + logo + bottom fruits image).
- Implemented a 3-step Onboarding flow with `PageView`, page indicators, and actions: Skip, Next, and Get Started.
- Added a full authentication flow including:
  - Welcome Screen (Sign-in Options)
  - Sign-in with Phone Number
  - Sign-up Screen
  - OTP Verification Screen
- Integrated `flutter_screenutil` across screens for responsive sizing.
- **Organized all hardcoded values** into centralized constant files for better maintainability.

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
    - All hardcoded values replaced with constants from `AppHeight`, `AppWidth`, `AppSizes`, and `AppTextStrings`.

- `lib/features/auth/presentation/screen/welcome_screen.dart`
  - welcomeScreen screen with multiple authentication methods:
    - Phone number authentication
    - Google sign-in
    - Facebook sign-in
  - Includes terms of service and privacy policy links.
  - All text strings use `AppTextStrings` constants.

- `lib/features/auth/modules/sign_in/presentation/screen/sign_in_screen.dart`
  - Screen for users to sign in using their phone number.
  - Uses `CustomPhoneNumberField`.
- `lib/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart`
  - Screen for new user registration.
  - Includes fields for name, phone number, and password.
- `lib/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart`
  - Asks the user to enter their phone number to receive an OTP.
- `lib/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen.dart`
  - Screen for users to enter the OTP they received.
  - Features a `Pinput` field for the code and a countdown timer.
  - Includes widgets: `OtpPinField` and `TimerSection`.

### Modified
- `lib/main.dart`
  - Starts app within `ScreenUtilInit` and points `home` to your chosen initial screen (`SpalshScreen` currently).
  - Added routes for new auth screens in `AppRoute`.

- `lib/features/splash/presentation/screen/spalsh_screen.dart`
  - Stack-based layout:
    - Background SVG (`AppImagesStrings.backgroundSplashImage`).
    - Center brand image (`AppImagesStrings.fruitMarketImage`).
    - Bottom fruits artwork pinned to bottom and full width (`AppImagesStrings.fruitsImage`).
  - Navigates to `OnboardingScreen` after 10 seconds.

- `lib/features/auth/presentation/widget/auth_button.dart`
  - Reusable authentication button widget.
  - All hardcoded values replaced with constants from `AppHeight`, `AppWidth`, and `AppSizes`.

- `lib/core/widget/button/primary_button.dart`
  - Primary button widget for onboarding and other screens.
  - All hardcoded values replaced with constants.

- `lib/features/onboarding/presentation/widget/skip_button.dart`
  - Skip button widget for onboarding screen.
  - Uses constants from `AppTextStrings`, `AppSizes`, `AppHeight`, and `AppWidth`.

- `lib/features/onboarding/presentation/widget/indactor.dart`
  - Page indicator widget for onboarding.
  - Uses constants from `AppSizes` and `AppWidth`.

## Constants Organization

All hardcoded values have been organized into centralized constant files for better maintainability:

### `lib/core/utils/constant/app_height.dart`
Contains all height values using `.h` extension:
- `h5`, `h17`, `h18`, `h21`, `h24`, `h51`, `h52`, `h53`, `h58`, `h61`, `h62`, `h79`, `h87`, `h221`, `h273`

### `lib/core/utils/constant/app_width.dart`
Contains all width values using `.w` extension:
- `w1`, `w10`, `w24`, `w31`, `w37`, `w177`, `w285`

### `lib/core/utils/constant/app_sizes.dart`
Contains font sizes (`.sp`) and radius values (`.r`):
- Font sizes: `sp14`, `sp15`, `sp16`, `sp42`
- Radius values: `r11`, `r12`, `r28`

### `lib/core/utils/constant/app_text_strings.dart`
Contains all text strings used throughout the app:
- **Onboarding**: `skip`, `next`, `getStarted`
- **Auth Screen**: `fruitMarket`, `welcomeToOurApp`, `signInWithPhoneNumber`, `signInWithGoogle`, `signInWithFacebook`, `alreadyMember`, `signIn`, `byContinueYouAgreeToOur`, `termsOfService`, `andOur`, `privacyPolicy`, `enterYourPhoneNumber`, `sendCode`, `enterThe4DigitCode`, `resendCode`, `verify`, `signUp`, `createAccount`, `fullName`, `password`

### Other Constants
- `lib/core/utils/constant/app_colors.dart` - Color definitions
- `lib/core/utils/constant/app_images_strings.dart` - Image asset paths
- `lib/core/utils/constant/dummy_data.dart` - Dummy data for onboarding pages

> Note: Your project already contains several core utilities and widgets used by the screens. This README assumes they exist as in your current tree:
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
- File: `lib/features/splash/presentation/screen/spalsh_screen.dart`
- Layout: `Stack` with three layers
  1) Fullscreen `SvgPicture.asset(AppImagesStrings.backgroundSplashImage)`
  2) `Positioned(top: AppHeight.h221, child: Image.asset(AppImagesStrings.fruitMarketImage))`
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
- Automatically navigates to `OnboardingScreen` after 10 seconds using a timer in `initState`.

## Onboarding Screen Details
- File: `lib/features/onboarding/presentation/screen/onboarding_screen.dart`
- Uses a `PageView.builder` over `pages` (from `dummy_data.dart`). Each page renders:
  - Illustration (SVG)
  - Title and subtitle (uses theme text styles)
  - Page indicators (`Indicators` widget)
  - Primary CTA (`PrimaryButton`) that shows `Next` or `Get Started` on last page
- Actions:
  - Skip: jumps to last page and navigates to Sign-in Options screen
  - Next: advances to next page; on last page it calls `_finish()`
  - `_finish()`: navigates to `SignInOptionsScreen`

## Auth Flow Details

### Welcome Screen
- File: `lib/features/auth/modules/welcome/presentation/screen/welcome_screen.dart`
- Serves as the entry point for authentication, offering multiple sign-in methods.
- Navigates to `SignInScreen` or `SignUpScreen`.

### Sign-up Screen
- File: `lib/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart`
- A form for new users to create an account with their name, phone number, and password.
- Navigates to `VerifyNumberScreen` upon submission.

### Sign-in Screen
- File: `lib/features/auth/modules/sign_in/presentation/screen/sign_in_screen.dart`
- Allows existing users to log in using their phone number.
- Navigates to `VerifyNumberScreen` to initiate OTP flow.

### Verify Number Screen
- File: `lib/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart`
- Prompts the user to enter their phone number to receive a verification code.
- Navigates to `OtpVerificationScreen`.

### OTP Verification Screen
- File: `lib/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen.dart`
- Users enter the 4-digit code sent to their phone.
- Features a `Pinput` field for code entry and a timer for resending the code.
- On successful verification, it should navigate to the `HomeScreen`.

### Hooking Up Navigation
- **From Welcome Screen**:
  - `Sign in with phone` button navigates to `SignInScreen`.
  - `Sign Up` link navigates to `SignUpScreen`.
- **From Sign-up / Sign-in**:
  - Both screens navigate to `VerifyNumberScreen` to start the phone verification process.
- **From Verify Number**:
  - Navigates to `OtpVerificationScreen` after a phone number is submitted.
- **From OTP Verification**:
  - On success, navigates to `HomeScreen`.

## Theming & Sizing
- `flutter_screenutil` is initialized with `designSize: Size(430, 932)` in `main.dart`.
- **Always use constants from `AppHeight`, `AppWidth`, and `AppSizes` instead of hardcoded values.**
- Never write values like `53.h`, `285.w`, or `15.sp` directly in widgets. Use `AppHeight.h53`, `AppWidth.w285`, `AppSizes.sp15` instead.
- Never hardcode strings like `"Skip"` or `"Fruit Market"`. Use `AppTextStrings.skip` and `AppTextStrings.fruitMarket` instead.
- Primary brand color used across screens: `AppColors.primaryGreen`.
- App Theming

app_text_theme.dart

Defines all text styles using GoogleFonts + ScreenUtil for responsive sizing.

Example:

displayLarge: GoogleFonts.notoSans(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
),

app_theme.dart

Sets up the global ThemeData for the app:

ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  textTheme: AppTextTheme.lightTextTheme,
);


Supports light mode now — ready for dark mode and component themes later.

## Troubleshooting
- SVG not visible: ensure `flutter_svg` is in `pubspec.yaml` and asset path is correct; some SVGs require `allowDrawingOutsideViewBox: true` or need a proper viewBox.
- Asset not found: confirm path case-sensitivity and that it’s under an included folder in `pubspec.yaml`.
- Layout shifts on different devices: verify `ScreenUtilInit` wraps `MaterialApp` and you use responsive units.

```

### Adding New Constants
When you need new values:
1. Add height values to `app_height.dart` (e.g., `static double h100 = 100.h;`)
2. Add width values to `app_width.dart` (e.g., `static double w200 = 200.w;`)
3. Add font sizes to `app_sizes.dart` (e.g., `static double sp18 = 18.sp;`)
4. Add radius values to `app_sizes.dart` (e.g., `static double r16 = 16.r;`)
5. Add text strings to `app_text_strings.dart` (e.g., `static const String welcome = 'Welcome';`)

## Next Steps
- Replace dummy onboarding SVG paths with your actual assets or wire to your constants.
- Customize navigation logic to navigate to your real entry screen.
- Optionally persist onboarding completion (e.g., using `shared_preferences`) to skip onboarding next app launch.
- Continue using constants for all new features to maintain code consistency.

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
