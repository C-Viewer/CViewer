import 'package:cviewer_frontend/domain/models/resume/resume_status.dart';
import 'package:flutter/material.dart';

class ResumeStatusLabel extends StatelessWidget {
  const ResumeStatusLabel({
    super.key,
    required this.status,
  });

  final ResumeStatus status;

  Color _getColor() {
    switch (status) {
      case ResumeStatus.draft:
        return Colors.grey;
      case ResumeStatus.opened:
        return Colors.lightBlue;
      case ResumeStatus.onReview:
        return Colors.blue;
      case ResumeStatus.fixRequired:
        return Colors.orange;
      case ResumeStatus.marked:
        return Colors.green;
      case ResumeStatus.finished:
        return Colors.purple;
    }
  }

  String _getText() {
    switch (status) {
      case ResumeStatus.draft:
        return 'Draft';
      case ResumeStatus.opened:
        return 'Opened';
      case ResumeStatus.onReview:
        return 'On review';
      case ResumeStatus.fixRequired:
        return 'Fix required';
      case ResumeStatus.marked:
        return 'Marked';
      case ResumeStatus.finished:
        return 'Finished';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getText(),
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: _getColor(),
          ),
    );
  }
}
