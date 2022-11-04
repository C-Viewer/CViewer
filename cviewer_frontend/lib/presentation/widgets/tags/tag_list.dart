import 'package:cviewer_frontend/presentation/widgets/tags/tag_chip.dart';
import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TagChip(label: 'Mobile'),
        SizedBox(width: 10),
        TagChip(label: 'Backend'),
        SizedBox(width: 10),
        TagChip(label: 'Frontend'),
      ],
    );
  }
}
