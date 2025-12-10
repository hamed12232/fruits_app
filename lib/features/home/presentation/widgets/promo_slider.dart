import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/core/utils/constant/app_height.dart';
import 'package:fruits_app/core/utils/constant/app_images_strings.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoSlider extends StatefulWidget {
  final double? height;
  const PromoSlider({super.key, this.height});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider>
    with AutomaticKeepAliveClientMixin {
  int _index = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? AppHeight.h130,
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
          ),
          items: [1, 2, 3, 4].map((i) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                fit: BoxFit.fill,
                width: AppWidth.w400,
                AppImagesStrings.promoBanner1,
              ),
            );
          }).toList(),
        ),
        Center(
          child: SmoothIndicator(
            offset: _index.toDouble(),
            count: 4,
            size: const Size(49, 7),
            effect: WormEffect(
              activeDotColor: AppColors.primaryGreen,
              dotColor: AppColors.lightGray,
              dotWidth: AppWidth.w8,
              dotHeight: AppHeight.h8,
            ),
          ),
        ),
      ],
    );
  }
}
