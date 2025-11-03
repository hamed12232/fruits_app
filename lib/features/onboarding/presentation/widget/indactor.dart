import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicators extends StatelessWidget {
  final int current;
  final int count;
  final Color activeColor;
  const Indicators({
    super.key,
    required this.current,
    required this.count,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final bool isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 12.r,
          width: 11.r,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: activeColor, width: 2.r),
          ),
        );
      }),
    );
  }
}
