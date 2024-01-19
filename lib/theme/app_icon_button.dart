import 'package:flutter/material.dart';
import 'package:space_bombs/theme/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconWidth = 49,
    this.iconHeight = 49,
    this.iconSize = 30,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final double iconWidth;
  final double iconHeight;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: iconWidth,
        height: iconHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.accent,
        ),
        padding: const EdgeInsets.all(2),
        child: Icon(
          icon,
          color: AppColors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
