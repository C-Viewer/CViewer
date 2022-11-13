import 'package:cviewer_frontend/domain/models/resume/resume.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_tile.dart';
import 'package:flutter/material.dart';

class ResumeList extends StatelessWidget {
  const ResumeList({
    super.key,
    required this.items,
  });

  final List<Resume> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      itemBuilder: (_, i) => ResumeTile(item: items[i]),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
