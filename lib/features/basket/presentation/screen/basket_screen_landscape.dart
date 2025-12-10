import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/style/spacing/vertical_space.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_text_strings.dart';
import 'package:fruits_app/core/widget/button/primary_button.dart';
import 'package:fruits_app/core/widget/common/custom_app_bar.dart';
import 'package:fruits_app/features/checkout/presentation/screen/checkout_main_screen.dart';
import 'package:fruits_app/features/seller/presentation/widget/seller_product_list_item_landscape.dart';

class BasketScreenLandscape extends StatelessWidget {
  const BasketScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homebackground,
      appBar: const CustomAppBar(
        title: AppTextStrings.basket,
        showBackButton: false,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VerticalSpace(height: AppHeight.h20),
                    SellerProductListItemLandscape(
                      productName: 'Product name',
                      currentPrice: '12.00 KD',
                      originalPrice: '14.00 KD',
                      hasDiscount: true,
                      isBasket: true,
                    ),
                    VerticalSpace(height: AppHeight.h16),
                    SellerProductListItemLandscape(
                      productName: 'Product name',
                      currentPrice: '12.00 KD',
                      originalPrice: '14.00 KD',
                      hasDiscount: true,
                      isBasket: true,
                    ),
                    VerticalSpace(height: AppHeight.h16),
                    SellerProductListItemLandscape(
                      productName: 'Product name',
                      currentPrice: '12.00 KD',
                      originalPrice: '14.00 KD',
                      hasDiscount: true,
                      isBasket: true,
                    ),
                    VerticalSpace(height: AppHeight.h16),
                    SellerProductListItemLandscape(
                      productName: 'Product name',
                      currentPrice: '12.00 KD',
                      originalPrice: '14.00 KD',
                      hasDiscount: true,
                      isBasket: true,
                    ),
                    VerticalSpace(height: AppHeight.h16),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(height: AppHeight.h20),

                  Padding(
                    padding: EdgeInsets.only(top: 1.h, bottom: 5.h),
                    child: Row(
                      children: [
                        Text(
                          "Total Items",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff656565),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "4 Items in cart",
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff656565),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff656565),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "36.00 ",
                              style: TextStyle(
                                fontSize: 7.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff656565),
                              ),
                            ),
                            Text(
                              "KD",
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffBEBEBE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Shipping Charges",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff656565),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "1.50 ",
                            style: TextStyle(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff656565),
                            ),
                          ),
                          Text(
                            "KD",
                            style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffBEBEBE),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Bag Total",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff204F38),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "37.50 ",
                            style: TextStyle(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff204F38),
                            ),
                          ),
                          Text(
                            "KD",
                            style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff204F38),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                    child: Row(
                      children: [
                        Text(
                          "4 items in cart",
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff656565),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "37.50 ",
                              style: TextStyle(
                                fontSize: 7.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff656565),
                              ),
                            ),
                            Text(
                              "KD",
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff656565),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: PrimaryButton(
                        label: "Checkout",
                        fontSize: 9.sp,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            CheckoutMainScreen.routeName,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsItem extends StatefulWidget {
  const ProductsItem({super.key});

  @override
  State<ProductsItem> createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 130.h, // Adjusted fixed height for better layout
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.16),
            ),
          ],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/png/vegetables.png",
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Product name",
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12.00 KD",
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff656565),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "14.00 KD",
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffD1D1D1),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 3.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDF958F),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Text(
                        "Up to 10% Off",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, size: 20),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      iconSize: 15,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          if (count > 1) {
                            count--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      "$count",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      iconSize: 15,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
