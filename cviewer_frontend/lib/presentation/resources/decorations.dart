import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Decorations {
  Decorations._();

  static const buttonPanel = BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        offset: Offset(0, -4),
        blurRadius: 20,
        color: AppColors.black25,
      ),
    ],
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
}
