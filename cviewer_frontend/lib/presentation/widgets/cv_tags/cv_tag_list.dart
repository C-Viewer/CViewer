import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/presentation/widgets/cv_tags/cv_tag_tile.dart';
import 'package:flutter/material.dart';

class CVTagList extends StatelessWidget {
  const CVTagList({
    super.key,
    required this.tags,
    required this.isSelected,
    required this.onPressed,
  });

  final List<CVTag> tags;
  final List<bool> isSelected;
  final void Function(int i) onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: tags.length,
      itemBuilder: (_, i) => GestureDetector(
        onTap: () => onPressed(i),
        behavior: HitTestBehavior.translucent,
        child: CVTagTile(
          tag: tags[i],
          isSelected: isSelected[i],
        ),
      ),
    );
  }
}
