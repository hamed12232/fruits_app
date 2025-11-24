import 'package:flutter/material.dart';

/// Breakpoints for responsive design
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1200;
}

enum DeviceType { mobile, tablet, desktop }

class AdaptiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget? tabletLayout;
  final Widget? desktopLayout;

  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
    this.desktopLayout,
  });

  // static DeviceType getDeviceType(BuildContext context) {
  //   final width = MediaQuery.of(context).size.width;
  //   if (width < Breakpoints.mobile) {
  //     return DeviceType.mobile;
  //   } else if (width < Breakpoints.tablet) {
  //     return DeviceType.tablet;
  //   } else {
  //     return DeviceType.desktop;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Breakpoints.mobile) {
          return mobileLayout;
        } else if (constraints.maxWidth < Breakpoints.tablet) {
          return tabletLayout ?? mobileLayout;
        } else {
          return desktopLayout ?? tabletLayout ?? mobileLayout;
        }
      },
    );
  }
}
