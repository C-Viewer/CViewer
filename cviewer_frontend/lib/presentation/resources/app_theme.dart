import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.darkGreen,
  scaffoldBackgroundColor: AppColors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkGreen,
    selectedItemColor: AppColors.lightGreen,
    unselectedItemColor: AppColors.white,
  ),
);
