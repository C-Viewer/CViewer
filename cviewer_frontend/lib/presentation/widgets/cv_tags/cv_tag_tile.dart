import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CVTagTile extends StatelessWidget {
  const CVTagTile({
    super.key,
    required this.tag,
    required this.isSelected,
  });

  final CVTag tag;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: isSelected ? AppColors.mint15 : null,
      child: Text(
        tag.name,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: isSelected ? AppColors.mint : null,
            ),
      ),
    );
  }
}
