import 'package:cviewer_frontend/constants/text_styles.dart';
import 'package:cviewer_frontend/data/repositories/mock_resume_repository.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_history_list.dart';
import 'package:flutter/material.dart';

class CVPage extends StatelessWidget {
  const CVPage({
    super.key,
    required this.cvId,
  });

  final int cvId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // TODO: обновить на реальные данные
        future: const MockResumeRepository().getCV(cvId),
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

  final CV resume;

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
          CVHistoryList(
            items: resume.history,
          ),
        ],
      ),
    );
  }
}
