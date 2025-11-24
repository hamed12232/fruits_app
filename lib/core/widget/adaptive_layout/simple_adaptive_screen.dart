import 'package:flutter/material.dart';

/// Simple adaptive wrapper that centers content with max-width on desktop
/// Use this for screens that don't need complex multi-column layouts
class SimpleAdaptiveScreen extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsets? padding;

  const SimpleAdaptiveScreen({
    super.key,
    required this.child,
    this.maxWidth = 600,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return child;
        } else {
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: padding ?? EdgeInsets.all(24),
              child: child,
            ),
          );
        }
      },
    );
  }
}
