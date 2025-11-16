import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/features/onboarding/presentation/model/on_boarding_model.dart';

final List<OnboardPageData> pages = const [
  OnboardPageData(
    title: 'E Shopping',
    subtitle: 'Explore op organic fruits & grab them',
    // Replace with your real asset
    imagePath: AppImagesStrings.onBoardingImage,
  ),
  OnboardPageData(
    title: 'Delivery Arrived',
    subtitle: 'Order is arrived at your Place',
    imagePath: AppImagesStrings.onBoardingImage,
  ),
  OnboardPageData(
    title: 'Delivery Arrived',
    subtitle: 'Order is arrived at your Place',
    imagePath: AppImagesStrings.onBoardingImage,
  ),
];
   const List<Map<String, dynamic>> sellersData = [
    {
      'name': 'Seller name',
      'charge': '0.5 KD',
      'category': 'Beverages',
      'distance': '2.5 KM',
      'rating': 4.5,
      'isOpen': true,
    },
    {
      'name': 'Seller name',
      'charge': '0.5 KD',
      'category': 'Pizza',
      'distance': '2.6 KM',
      'rating': 4.5,
      'isOpen': false,
    },
    {
      'name': 'Seller name',
      'charge': 'Free',
      'category': 'Fried Chicken',
      'distance': '2.5 KM',
      'rating': 4.5,
      'isOpen': true,
    },
  ];
   const List<Map<String, String>> categories = [
    {'title': 'مطاعم', 'image': AppImagesStrings.restruants},
    {'title': 'مزرعة', 'image': AppImagesStrings.farm},
    {'title': 'قهوة', 'image': AppImagesStrings.coffe},
    {'title': 'صيدلية', 'image': AppImagesStrings.pharmcy},
  ];