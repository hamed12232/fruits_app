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
- ✅ Checkout Screen with delivery time selection
- ✅ Reusable calendar picker component
- ✅ Address management with add/edit functionality
 - ✅ Checkout Payment Screen (coupon, order details, payment options, stepper)
 - ✅ Address selector UI with add dialog and selection state

## Recent Updates

### Refactored Address Selector (Nov 18, 2025)

Completely refactored the address selection system with improved UI and state management:

#### New Components:
- `AddressSelector` - Main widget for address selection
- `AddressItem` - Displays individual address cards with selection state
- `AddAddressDialog` - Modal for adding new addresses
- `AddressForm` - Reusable form for address input

#### Key Changes:
- Split large components into smaller, focused widgets
- Improved state management with proper widget lifecycle
- Enhanced UI with consistent theming using `AppColors`
- Added validation for address form
- Improved visual feedback for selected addresses

#### Location:
- `lib/features/checkout/presentation/widget/addreess_widgets/`
  - `address_item.dart`
  - `address_form.dart`
  - `add_address_dialog.dart`

### UI Improvements (Nov 18, 2025)

#### Address Selector:
- Updated text styles to use theme for consistency
- Improved visual hierarchy in address cards
- Added proper spacing and padding
- Enhanced visual feedback for interactive elements

#### General:
- Standardized button styles and colors
- Improved form validation
- Better error handling for empty form submissions
- Consistent use of theme colors and text styles

### Refactored SelectableWidget for Calendar (Nov 17, 2025)

Refactored the `SelectableWidget` into smaller, more maintainable components for better calendar integration:

#### New Components:
- `SelectableItem` - Base widget for selectable items with consistent styling
- `CalendarSelector` - Reusable calendar picker component
- `SelectionIndicator` - Visual indicator for selected state

#### Key Changes:
- Separated UI concerns into distinct widgets
- Improved state management for calendar visibility
- Added support for both "Now" and date selection modes
- Enhanced reusability across the application

#### Location:
- `lib/features/checkout/presentation/widget/selectable_widgets/`
  - `selectable_item.dart` (main widget)
  - `calendar_selector.dart` (calendar picker)
  - `selection_indicator.dart` (visual feedback)

### Refactored Basket Summary Section (Nov 17, 2025)

Refactored the `BasketSummarySection` widget into smaller, more maintainable components:

#### New Components:
- `BasketDashedLine` - Reusable dashed line widget for visual separation
- `BasketCostRow` - Displays cost-related rows (Subtotal, Shipping, Total)
- `BasketSummaryFooter` - Contains item count and checkout button

#### Benefits:
- Improved code organization and maintainability
- Better separation of concerns
- Easier to test individual components
- More reusable UI components

#### Location:
- `lib/features/basket/presentation/widget/basket_summary_section.dart` (refactored)
- `lib/features/basket/presentation/widget/basket_dashed_line.dart` (new)
- `lib/features/basket/presentation/widget/basket_cost_row.dart` (new)
- `lib/features/basket/presentation/widget/basket_summary_footer.dart` (new)

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

## Changelog (since last commit - Nov 19, 2025)

- Added Checkout payment UI and supporting widgets:
  - `lib/features/checkout/presentation/screen/checkout_payment_screen.dart` — Payment step screen (coupon, order details, payment options, stepper).
  - `lib/features/checkout/presentation/widget/checkout_stepper.dart` — Stepper widget used in checkout flow.
  - `lib/features/checkout/presentation/widget/checkout_order_details.dart` — Order details summary using `BasketCostRow`.
  - `lib/features/checkout/presentation/widget/payment_widgets/coupon_card.dart` — Coupon input with "Apply" button.
  - `lib/features/checkout/presentation/widget/payment_widgets/payment_options.dart` — Selectable payment option cards.

- Added Address selector UI:
  - `lib/features/checkout/presentation/widget/addreess_widgets/addresss_selector.dart` — Address selection UI with add dialog and selection state.

- Wired `CheckoutPaymentScreen` into the checkout flow (`CheckoutMainScreen` `steps`).

---

**Note**: This project uses a Feature-First architecture with clear separation between Presentation and Business Logic.
