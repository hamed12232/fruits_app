# Home Screen Setup Guide

## Overview
I've created a complete HomeScreen UI matching your design requirements with all the components.

## Created Files

### 1. Widgets
- `lib/features/home/presentation/widgets/promo_slider.dart` - Carousel slider with dots indicator
- `lib/features/home/presentation/widgets/category_section.dart` - Category icons section
- `lib/features/home/presentation/widgets/seller_card.dart` - Seller card component

### 2. Screens
- `lib/features/home/presentation/screens/home_screen.dart` - Main home screen
- `lib/features/home/presentation/screens/main_navigation_screen.dart` - Navigation wrapper with google_nav_bar

### 3. Updated Constants
- `app_height.dart` - Added more height values (h4, h8, h10, h12, h16, h20, h32, h40, h48, h56, h60, h80, h100, h120, h140, h160, h180)
- `app_width.dart` - Added more width values (w4, w5, w8, w12, w14, w16, w20, w32, w40, w48, w56, w60, w64, w70, w80, w90, w100)
- `app_colors.dart` - Added colors (teal, lightTeal, red, orange, green, cardBackground, ratingYellow)
- `app_sizes.dart` - Added font sizes and radius values
- `app_images_strings.dart` - Added image paths for banners, categories, and logos

### 4. Packages Added
- `carousel_slider: ^5.0.0`
- `dots_indicator: ^3.0.0`
- `google_nav_bar: ^5.0.6`

## Next Steps

### 1. Add Images
You need to add the following images to `assets/images/png/`:
- `promo_banner_1.png`
- `promo_banner_2.png`
- `promo_banner_3.png`
- `vegetables.png`
- `fruits.png`
- `beverages.png`
- `grocery.png`
- `company_logo.png`

### 2. Update Routes
Add the routes to your routing file:

```dart
import 'package:fruits_app/features/home/presentation/screens/main_navigation_screen.dart';

// In your routes
MainNavigationScreen.routeName: (context) => const MainNavigationScreen(),
```

### 3. Navigate to Home
From your authentication flow, navigate to:
```dart
Navigator.pushReplacementNamed(context, MainNavigationScreen.routeName);
```

## Features Implemented

✅ Carousel slider with auto-play and dots indicator
✅ Category section with 4 categories
✅ Seller cards with:
  - Company logo
  - Seller name
  - Rating display
  - Delivery charges
  - Open/Close status
  - Category
  - Distance
✅ Bottom navigation bar using google_nav_bar
✅ Responsive design using flutter_screenutil
✅ All values from constant files (AppHeight, AppWidth, AppColors, AppSizes)
✅ Search and filter icons in header
✅ "Show all" button for sellers section

## Customization

### Change Slider Images
Edit `promo_slider.dart` and update the items array:
```dart
items: [
  _buildPromoCard(AppImagesStrings.promoBanner1),
  _buildPromoCard(AppImagesStrings.promoBanner2),
  _buildPromoCard(AppImagesStrings.promoBanner3),
],
```

### Add More Sellers
Edit `home_screen.dart` and add more `SellerCard` widgets:
```dart
SellerCard(
  sellerName: 'Your Seller Name',
  deliveryCharge: '1.0 KD',
  category: 'Category Name',
  distance: '3.0 KM',
  rating: 4.8,
  isOpen: true,
),
```

### Modify Navigation Tabs
Edit `main_navigation_screen.dart` to change tabs or add new screens.

## Notes
- The UI is fully responsive using flutter_screenutil
- All colors, sizes, and dimensions use your constant files
- Error builders are included for missing images
- The navigation bar matches the green theme from your design
