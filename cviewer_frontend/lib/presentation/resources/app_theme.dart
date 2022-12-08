import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.emerald,
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.emerald,
    centerTitle: true,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.emerald,
    selectedItemColor: AppColors.mint,
    unselectedItemColor: AppColors.white,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(AppColors.white),
      backgroundColor: MaterialStatePropertyAll(AppColors.emerald),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20)),
    ),
  ),
);
