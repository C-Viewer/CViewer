import 'package:cviewer_frontend/domain/models/tag/tag.dart';
import 'package:cviewer_frontend/presentation/widgets/tags/tag_chip.dart';
import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.items,
  });

  final List<Tag> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final it in items) ...[
          TagChip(item: it),
          const SizedBox(width: 10),
        ],
      ],
    );
  }
}
