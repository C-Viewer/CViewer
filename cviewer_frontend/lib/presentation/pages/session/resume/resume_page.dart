import 'package:cviewer_frontend/data/repositories/mock_resume_repository.dart';
import 'package:cviewer_frontend/domain/models/resume/resume.dart';
import 'package:cviewer_frontend/constants/text_styles.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_history_list.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({
    super.key,
    required this.resumeId,
  });

  final int resumeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: const MockResumeRepository().getResume(resumeId),
        builder: (_, snapshot) => snapshot.data != null
            ? _Content(
                resume: snapshot.data!,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.resume,
  });

  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(36),
      child: Column(
        children: [
          // Title
          Text(
            resume.title,
            style: TextStyles.titleXXL,
          ),
          const SizedBox(height: 20),
          // History
          ResumeHistoryList(
            items: resume.history,
          ),
        ],
      ),
    );
  }
}
