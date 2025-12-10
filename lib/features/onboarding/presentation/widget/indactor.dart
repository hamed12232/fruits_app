import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_radius.dart';
import 'package:fruits_app/core/utils/constant/app_width.dart';

class Indicators extends StatelessWidget {
  final int current;
  final int count;
  final Color activeColor;
  final double? height;
  final double? width;
  const Indicators({
    super.key,
    required this.current,
    required this.count,
    required this.activeColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final bool isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: AppWidth.w10),
          height: height ?? AppBorderRadius.r12,
          width: width ?? AppBorderRadius.r11,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: activeColor, width: AppWidth.w1),
          ),
        );
      }),
    );
  }
}
