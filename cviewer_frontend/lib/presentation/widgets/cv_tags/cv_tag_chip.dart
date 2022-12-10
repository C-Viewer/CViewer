import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
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
      label: Text(item.name),
      backgroundColor: color,
    );
  }
}
