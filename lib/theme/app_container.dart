import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color color;

  const AppContainer({
    required this.child,
    this.radius = 32.0,
    this.color = AppColors.card,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
