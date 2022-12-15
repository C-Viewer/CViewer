import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CVTagChip extends StatelessWidget {
  const CVTagChip({
    super.key,
    required this.item,
    this.color,
  });

  final CVTag item;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        item.name,
        style: const TextStyle(
          color: AppColors.black,
        ),
      ),
      backgroundColor: color,
    );
  }
}
