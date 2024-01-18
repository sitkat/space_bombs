import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.surface,
    primaryColor: AppColors.primary,
    iconTheme:  IconThemeData(color: AppColors.primary),
    cardColor: AppColors.dark_surface,
  );
}