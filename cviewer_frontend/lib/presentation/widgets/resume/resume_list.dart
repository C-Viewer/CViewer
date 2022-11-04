import 'package:cviewer_frontend/presentation/widgets/resume/resume_tile.dart';
import 'package:flutter/material.dart';

class ResumeList extends StatelessWidget {
  const ResumeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      itemBuilder: (_, i) => const ResumeTile(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
