# Fruits App

A Flutter application for managing a fruits and vegetables marketplace with a modern UI and responsive design.

## Overview

The app includes:
- ✅ Splash Screen
- ✅ Onboarding Screen - 3 pages
- ✅ Welcome Screen with sign-in options
- ✅ Complete Authentication Modules (Sign In, Sign Up, Verify Number, OTP Verification)
- ✅ Home Screen with products and categories display
- ✅ Bottom Navigation Bar
- ✅ All values organized in centralized constant files

## Technologies & Packages

### Core Packages
- `flutter_screenutil: ^5.9.3` - For responsive design (Design size: 430x932)
- `flutter_svg: ^2.2.1` - For rendering SVG files
- `google_fonts: ^6.3.2` - For custom fonts
- `pin_code_fields: ^8.0.1` - For OTP input fields
- `intl_phone_field: ^3.2.0` - For phone number input fields
- `carousel_slider: ^5.0.0` - For banner display
- `smooth_page_indicator: ^1.2.1` - For page indicators
- `google_nav_bar: ^5.0.6` - For bottom navigation bar

## Project Structure

### Features

#### 1. Splash & Onboarding
- `lib/features/splash/presentation/screen/spalsh_screen.dart`
- `lib/features/onboarding/presentation/screen/onboarding_screen.dart`
- `lib/features/onboarding/presentation/widget/skip_button.dart`
- `lib/features/onboarding/presentation/widget/indactor.dart`

#### 2. Authentication Modules
- `lib/features/auth/modules/welcome/presentation/screen/welcome_screen.dart`
- `lib/features/auth/modules/sign_in/presentation/screen/sign_in_screen.dart`
- `lib/features/auth/modules/sign_up/presentation/screen/sign_up_screen.dart`
- `lib/features/auth/modules/verify_number/presentation/screen/verify_number_screen.dart`
- `lib/features/auth/modules/otp_verification/presentation/screen/otp_verification_screen.dart`
- `lib/features/auth/modules/otp_verification/presentation/widget/otp_pin_field.dart`
- `lib/features/auth/modules/otp_verification/presentation/widget/timer_section.dart`

#### 3. Home Screen
- `lib/features/home/presentation/screens/home_screen.dart`
- `lib/features/home/presentation/screens/main_navigation_screen.dart`
- `lib/features/home/presentation/widgets/promo_slider.dart`
- `lib/features/home/presentation/widgets/category_section.dart`
- `lib/features/home/presentation/widgets/category_item.dart`
- `lib/features/home/presentation/widgets/seller_card.dart`
- `lib/features/home/presentation/widgets/product_list_view.dart`
- `lib/features/home/presentation/widgets/filter_dialog.dart`
- `lib/features/home/presentation/widgets/top_section_heading.dart`

## Centralized Constants

All hardcoded values have been moved to centralized constant files for easier maintenance:

### `lib/core/utils/constant/app_height.dart`
Contains all height values:
```dart
h4, h5, h7, h8, h10, h12, h14, h16, h17, h18, h20, h21, h23, h24, h30, h32, h33, 
h40, h41, h47, h48, h51, h52, h53, h56, h58, h60, h61, h62, h68, h79, h80, h87, 
h100, h120, h130, h140, h160, h180, h221, h273, h348
```

### `lib/core/utils/constant/app_width.dart`
Contains all width values:
```dart
w1, w4, w5, w6, w7, w8, w10, w11, w12, w13, w14, w16, w20, w24, w25, w29, w31, 
w32, w37, w40, w42, w48, w56, w60, w64, w70, w80, w90, w100, w177, w285, w354, w400
```

### `lib/core/utils/constant/app_sizes.dart`
Contains font sizes (`.sp`) and radius values (`.r`):
- Font sizes: `sp10, sp12, sp14, sp15, sp16, sp17, sp18, sp19, sp20, sp22, sp24, sp28, sp30, sp35, sp42`
- Radius values: `r8, r12, r16, r20, r24, r25, r30`

### `lib/core/utils/constant/app_text_strings.dart`
Contains all text strings used in the app:
- Onboarding: `skip`, `next`, `getStarted`
- Auth: `signIn`, `signUp`, `login`, `phoneNumber`, `password`, `forgotPassword`
- OTP: `enterReceivedOTP`, `confirm`, `notReceived`, `sendAgain`
- And more...

### Other Constant Files
- `app_colors.dart` - Color definitions
- `app_images_strings.dart` - Image asset paths
- `app_radius.dart` - Radius values (BorderRadius)
- `dummy_data.dart` - Dummy data

## Implemented Features

### Authentication Flow
✅ Welcome screen with multiple authentication options  
✅ Sign In screen  
✅ Sign Up screen  
✅ Phone number verification (Verify Number)  
✅ OTP verification with timer and resend functionality  
✅ Using `pin_code_fields` for OTP input  
✅ Performance optimizations to reduce skipped frames

### Home Screen
✅ Carousel slider for promotional banners  
✅ Category section with 4 categories  
✅ Seller cards with:
  - Company logo
  - Seller name
  - Rating display
  - Delivery charges
  - Open/Close status
  - Category and distance
✅ Bottom navigation bar using `google_nav_bar`  
✅ Search and filter icons in header  
✅ Filter dialog

## Navigation

### Routes
- `/splash` → `SpalshScreen`
- `/onBoarding` → `OnboardingScreen`
- `/welcome` → `WelcomeScreen`
- `/sign-in` → `SignInScreen`
- `/sign-up` → `SignUpScreen`
- `/verify-number` → `VerifyNumberScreen`
- `/otp-verification` → `OtpVerificationScreen`
- `/home` → `HomeScreen`
- `/main-navigation` → `MainNavigationScreen`

### Navigation Flow
```
Splash → Onboarding → Welcome → Sign In/Sign Up
                                    ↓
                            Verify Number → OTP Verification
                                    ↓
                              Main Navigation (Home)
```

## Setup & Usage

### 1. Install Packages
```bash
flutter pub get
```

### 2. Add Required Images
Add the following images to `assets/images/png/`:
- `promo_banner_1.png`, `promo_banner_2.png`, `promo_banner_3.png`
- `vegetables.png`, `fruits.png`, `beverages.png`, `grocery.png`
- `company_logo.png`
- `search_icon.png`, `category_app_bar.png`
- `home_icon.png`, `category_icon.png`, `cart_icon.png`, `favorite_icon.png`, `more_icon.png`

### 3. Setup Routes
Make sure all routes are added in `lib/core/utils/routes/app_route.dart`

## Best Practices

### Using Constants
❌ **Don't use:**
```dart
width: 354.w
height: 130.h
fontSize: 15.sp
Text("Skip")
```

✅ **Use:**
```dart
width: AppWidth.w354
height: AppHeight.h130
fontSize: AppSizes.sp15
Text(AppTextStrings.skip)
```

### Adding New Constants
When you need new values:
1. Add height values to `app_height.dart`
2. Add width values to `app_width.dart`
3. Add font sizes/radius to `app_sizes.dart`
4. Add text strings to `app_text_strings.dart`

## Performance Optimizations

### OTP Verification Screen
The following optimizations were applied to reduce skipped frames:
- ✅ Using `WidgetsBinding.instance.addPostFrameCallback` to delay Timer start
- ✅ Checking `mounted` before `setState`
- ✅ Using `RepaintBoundary` to isolate repaints
- ✅ Separating Timer UI into a separate widget
- ✅ Disabling unnecessary animations (`animationType: none`)

## Customization

### Change Banner Images
Edit `promo_slider.dart`:
```dart
items: [1, 2, 3, 4].map((i) {
  return Image.asset(AppImagesStrings.promoBanner1);
}).toList()
```

### Add New Sellers
Edit `product_list_view.dart` and add new `SellerCard` widgets

### Modify Navigation Bar
Edit `main_navigation_screen.dart` to change tabs or add new screens

## Troubleshooting

- **SVG not visible**: Ensure `flutter_svg` is in `pubspec.yaml` and image path is correct
- **Image not found**: Check case sensitivity and path correctness in `pubspec.yaml`
- **Layout changes on different devices**: Ensure `ScreenUtilInit` wraps `MaterialApp`
- **Skipped frames**: Use `RepaintBoundary` and separate heavy widgets

## Next Steps

- [ ] Connect authentication screens to Backend
- [ ] Add Onboarding state persistence using `shared_preferences`
- [ ] Add State Management (Provider or Bloc)
- [ ] Add Unit Tests
- [ ] Improve UX and add more interactions

---

**Note**: This project uses a Feature-First architecture with clear separation between Presentation and Business Logic.
