import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
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
        return AppColors.grey;
      case CVStatus.sentToReview:
        return AppColors.green;
      case CVStatus.takenOnReview:
        return AppColors.blue;
      case CVStatus.needFix:
        return AppColors.red;
      case CVStatus.reviewed:
        return AppColors.mint;
      case CVStatus.finished:
        return AppColors.black;
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
      case CVStatus.reviewed:
        return S.of(context).reviewed;
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
