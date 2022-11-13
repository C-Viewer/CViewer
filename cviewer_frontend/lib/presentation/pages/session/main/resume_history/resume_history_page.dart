import 'package:cviewer_frontend/data/repositories/mock_resume_repository.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_list.dart';
import 'package:flutter/material.dart';

class ResumeHistoryPage extends StatelessWidget {
  const ResumeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: const MockResumeRepository().getResumeList(),
        builder: (_, snapshot) => snapshot.hasData
            ? ResumeList(items: snapshot.data ?? [])
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO:
        },
        child: const Icon(Icons.create_rounded),
      ),
    );
  }
}
