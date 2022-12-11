import 'package:cviewer_frontend/assets/strings/l10n.dart';
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
      case CVStatus.sentToReview:
        return Colors.lightBlue;
      case CVStatus.takenOnReview:
        return Colors.blue;
      case CVStatus.needFix:
        return Colors.orange;
      case CVStatus.finished:
        return Colors.purple;
    }
  }

  String _getText(BuildContext context) {
    switch (status) {
      case CVStatus.draft:
        return S.of(context).draft;
      case CVStatus.sentToReview:
        return S.of(context).availableForReview;
      case CVStatus.takenOnReview:
        return S.of(context).onReview;
      case CVStatus.needFix:
        return S.of(context).fixRequired;
      case CVStatus.finished:
        return S.of(context).finished;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getText(context),
      style: TextStyle(
        color: _getColor(),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
