import 'package:cviewer_frontend/domain/models/tag/tag.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.item,
    this.color,
  });

  final Tag item;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(item.name),
      backgroundColor: color,
    );
  }
}
