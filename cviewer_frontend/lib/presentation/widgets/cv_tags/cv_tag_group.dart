import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/presentation/widgets/cv_tags/cv_tag_chip.dart';
import 'package:flutter/material.dart';

class CVTagGroup extends StatelessWidget {
  const CVTagGroup({
    super.key,
    required this.tags,
  });

  final List<CVTag> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final it in tags) ...[
          CVTagChip(item: it),
          const SizedBox(width: 10),
        ],
      ],
    );
  }
}
