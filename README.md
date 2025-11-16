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
- ✅ Seller Screen with categories and products
- ✅ Product Detail Screen with expandable sections

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

#### 4. Seller Screen
- `lib/features/seller/presentation/screen/seller_screen.dart`
- `lib/features/seller/presentation/widget/seller_info_card.dart`
- `lib/features/seller/presentation/widget/seller_categories_section.dart`
- `lib/features/seller/presentation/widget/seller_category_item.dart`
- `lib/features/seller/presentation/widget/seller_products_section.dart`
- `lib/features/seller/presentation/widget/seller_product_list_item.dart`

#### 5. Product Screen
- `lib/features/product/presentation/screen/product_screen.dart`
- `lib/features/product/presentation/widget/product_image_card.dart`
- `lib/features/product/presentation/widget/product_details_section.dart`
- `lib/features/product/presentation/widget/product_expandable_section.dart`
- `lib/features/product/presentation/widget/product_option_radio.dart`
- `lib/features/product/presentation/widget/product_add_to_cart_button.dart`

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

### Seller Screen
✅ Seller information card with:
  - Company logo (circular)
  - Seller name
  - Delivery time display
  - Open/Close status indicator
  - Rating display
  - Discount badge
✅ Categories section with 4 category items
✅ Products section with:
  - Product list items
  - Price display (with original price strikethrough)
  - Discount badges
  - Add to cart functionality
✅ Modular widget architecture for maintainability

### Product Screen
✅ Product detail page with:
  - Product image card with discount badge
  - Product information section (category, name, price, description, sell per)
  - Expandable weight selection section with radio options
  - Expandable addons selection section with radio options
  - Add to cart button with shopping basket icon
✅ Modular widget architecture for maintainability
✅ State management for selected weight and addons

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
- `/seller` → `SellerScreen`
- `/product` → `ProductScreen`

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

## Recent Changes

### Seller Screen Refactoring & UI Updates

#### Widget Architecture Improvements
- ✅ **Split seller screen into modular widgets** for better maintainability:
  - `SellerInfoCard` - Seller information display
  - `SellerCategoriesSection` - Categories section container
  - `SellerCategoryItem` - Individual category card
  - `SellerProductsSection` - Products section container
  - `SellerProductListItem` - Individual product list item

#### UI/UX Updates

**Seller Category Item (`seller_category_item.dart`)**
- Changed layout structure from `SizedBox` wrapper to `Column` layout
- Updated border radius from `r25` to `r15` for more compact appearance
- Changed image fit from `BoxFit.contain` to `BoxFit.cover` for better image display
- Changed title font weight from `FontWeight.w600` to `FontWeight.w400` for lighter appearance
- Improved shadow opacity from `0.05` to `0.1` for better visibility
- Moved category title outside container with top padding for cleaner layout

**Seller Categories Section (`seller_categories_section.dart`)**
- Updated Phone category image to use `AppImagesStrings.pets`
- Updated Pets category image to use `AppImagesStrings.pets`

**Seller Product List Item (`seller_product_list_item.dart`)**
- **Product Image Styling:**
  - Replaced `ClipOval` with `DecorationImage` for better control
  - Added circular border with `AppColors.lightGray` at 40% opacity
  - Changed background color to `AppColors.white`
  - Improved image display with `BoxFit.contain` and border styling
- **Typography Updates:**
  - Reduced product name font size from `sp19` to `sp16`
  - Changed product name font weight to `FontWeight.bold`
  - Updated price font size from `sp16` to `sp14`
  - Changed price font weight from `w600` to `w400` for consistency
- **Discount Badge:**
  - Updated discount badge color to use `AppColors.upToTenPercentOff`
  - Changed badge text font weight from `w600` to `w400`
- **Add to Cart Button:**
  - Increased icon size from `w32 x h32` to `w56 x h52` for better touch target

**Seller Products Section (`seller_products_section.dart`)**
- Replaced `IconButton` with `Image.asset` for filter icon
- Changed filter icon from `categoryAppBar` to `format` image
- Removed unused `app_width.dart` import

**Seller Screen (`seller_screen.dart`)**
- Removed `BouncingScrollPhysics` from `SingleChildScrollView` for smoother scrolling
- Cleaned up code comments for better readability

#### Color Updates
- Added new color `AppColors.upToTenPercentOff` for discount badges

### Product Screen Implementation & UI Updates

#### Widget Architecture
- ✅ **Created complete product detail screen** with modular widgets:
  - `ProductImageCard` - Product image display with discount badge
  - `ProductDetailsSection` - Product information (category, name, price, description)
  - `ProductExpandableSection` - Expandable/collapsible sections for weight and addons
  - `ProductOptionRadio` - Custom radio button for selection options
  - `ProductAddToCartButton` - Add to cart button with icon

#### UI/UX Updates

**Product Image Card (`product_image_card.dart`)**
- Removed errorBuilder for cleaner code
- Light pink background with rounded corners
- Discount badge positioned in top right corner

**Product Details Section (`product_details_section.dart`)**
- **Layout Improvements:**
  - Changed product name and price to horizontal row layout with `MainAxisAlignment.spaceBetween`
  - Updated alignment to `CrossAxisAlignment.center` for better vertical centering
  - Removed vertical spacing between category and product name for tighter layout
- **Typography Updates:**
  - Increased category name font size from `sp14` to `sp16`
  - Increased product name font size from `sp19` to `sp24` for better prominence
  - Changed price column alignment to `CrossAxisAlignment.center`
- **Color Updates:**
  - Changed original price strikethrough color from `AppColors.red` to `AppColors.upToTenPercentOff`
  - Changed "Sell Per" text color to `AppColors.greyTextColor` for consistency

**Product Add to Cart Button (`product_add_to_cart_button.dart`)**
- **Positioning:**
  - Changed padding from symmetric to `EdgeInsets.only` with `right: w20` and `bottom: w90`
  - Removed left padding and top padding for right-aligned positioning
- **Icon Updates:**
  - Increased icon size from `w24 x h24` to `w32 x h32`
  - Added `BoxFit.cover` for better icon display
  - Removed color filter (commented out)

**Product Screen (`product_screen.dart`)**
- **AppBar Updates:**
  - Replaced favorite `IconButton` with `Image.asset` using `AppImagesStrings.favoriteIcon`
  - Changed favorite icon size to `w32 x h32` with `BoxFit.cover`
  - Replaced share icon with `CupertinoIcons.share` for iOS-style icon
  - Added `flutter/cupertino.dart` import
- **Product Image:**
  - Changed product image path from `AppImagesStrings.fruitsImage` to `AppImagesStrings.product`
- **Button Positioning:**
  - Wrapped `ProductAddToCartButton` in `Align` widget with `Alignment.bottomRight`
  - Button now positioned at bottom right of screen

## Next Steps

- [ ] Connect authentication screens to Backend
- [ ] Add Onboarding state persistence using `shared_preferences`
- [ ] Add State Management (Provider or Bloc)
- [ ] Add Unit Tests
- [ ] Improve UX and add more interactions

---

**Note**: This project uses a Feature-First architecture with clear separation between Presentation and Business Logic.
