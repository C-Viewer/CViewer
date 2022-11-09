import 'package:cviewer_frontend/presentation/widgets/resume/resume_list.dart';
import 'package:flutter/material.dart';

class ApplicantReviewHistoryScreen extends StatelessWidget {
  const ApplicantReviewHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ResumeList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 
        },
        child: const Icon(Icons.create_rounded),
      ),
    );
  }
}
