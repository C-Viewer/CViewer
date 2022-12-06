import 'package:cviewer_frontend/domain/models/cv/date_sortable.dart';

class CVCommentInfo implements DateSortable {
  const CVCommentInfo({
    required this.comment,
    required this.date,
  });

  final String comment;

  @override
  final DateTime date;
}
