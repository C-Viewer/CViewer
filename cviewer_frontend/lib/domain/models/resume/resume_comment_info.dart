import 'package:cviewer_frontend/domain/models/resume/date_sortable.dart';

class ResumeCommentInfo implements DateSortable {
  const ResumeCommentInfo({
    required this.comment,
    required this.date,
  });

  final String comment;

  @override
  final DateTime date;
}
