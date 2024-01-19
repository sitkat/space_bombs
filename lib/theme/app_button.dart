import 'package:flutter/material.dart';
import 'package:space_bombs/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.accent,
    this.radius = 32.0,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Container(
          height: 49,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
