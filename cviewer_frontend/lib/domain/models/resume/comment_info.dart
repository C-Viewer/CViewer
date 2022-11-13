import 'package:cviewer_frontend/domain/models/resume/date_sortable.dart';

class CommentInfo implements DateSortable {
  const CommentInfo({
    required this.comment,
    required this.date,
  });

  final String comment;

  @override
  final DateTime date;
}
