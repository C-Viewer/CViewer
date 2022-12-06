import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:flutter/material.dart';

class CVStatusLabel extends StatelessWidget {
  const CVStatusLabel({
    super.key,
    required this.status,
  });

  final CVStatus status;

  Color _getColor() {
    switch (status) {
      case CVStatus.draft:
        return Colors.grey;
      case CVStatus.opened:
        return Colors.lightBlue;
      case CVStatus.onReview:
        return Colors.blue;
      case CVStatus.fixRequired:
        return Colors.orange;
      case CVStatus.marked:
        return Colors.green;
      case CVStatus.finished:
        return Colors.purple;
    }
  }

  // TODO: intl
  String _getText() {
    switch (status) {
      case CVStatus.draft:
        return 'Draft';
      case CVStatus.opened:
        return 'Opened';
      case CVStatus.onReview:
        return 'On review';
      case CVStatus.fixRequired:
        return 'Fix required';
      case CVStatus.marked:
        return 'Marked';
      case CVStatus.finished:
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
