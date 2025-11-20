import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
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
    final List<Map<String, dynamic>> orders = [
      {
        'orderId': '#243188',
        'price': '37 KD',
        'date': '9 Sep',
        'itemsCount': '4',
        'status': 'Delivering',
        'statusColor': AppColors.yellow,
        'statusIcon': AppImagesStrings.deliveringOrder,
        'statusIconBackground': AppColors.yellow.withOpacity(0.2),
      },
      {
        'orderId': '#882610',
        'price': '', // Price not shown in design for other cards
        'date': '8 Sep',
        'itemsCount': '3',
        'status': 'Finished',
        'statusColor': AppColors.green,
        'statusIcon': AppImagesStrings.finishedOrder,
        'statusIconBackground': AppColors.green.withOpacity(0.2),
      },
      {
        'orderId': '#882610',
        'price': '',
        'date': '8 Sep',
        'itemsCount': '3',
        'status': 'Canceled',
        'statusColor': AppColors.failureColor,
        'statusIcon': AppImagesStrings.cancelOrder,
        'statusIconBackground': AppColors.failureColor.withOpacity(0.4),
      },
      {
        'orderId': '#882610',
        'price': '',
        'date': '8 Sep',
        'itemsCount': '3',
        'status': 'Working',
        'statusColor': AppColors.blue,
        'statusIcon': AppImagesStrings.workingOrder,
        'statusIconBackground': AppColors.blue.withOpacity(0.5),
      },
      {
        'orderId': '#882610',
        'price': '',
        'date': '8 Sep',
        'itemsCount': '3',
        'status': 'Delivered',
        'statusColor': Colors.purple,
        'statusIcon': AppImagesStrings.deliveredOrder,
        'statusIconBackground': Colors.purple.withOpacity(0.4),
      },
      {
        'orderId': '#882610',
        'price': '',
        'date': '8 Sep',
        'itemsCount': '3',
        'status': 'New',
        'statusColor': Colors.lightBlue,
        'statusIcon': AppImagesStrings.newOrder,
        'statusIconBackground': Colors.lightBlue.withOpacity(0.4),
      },
    ];