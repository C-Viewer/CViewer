import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/domain/models/cv/date_sortable.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';

class CV {
  const CV({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.creationDate,
    required this.rating,
    required this.tags,
    required this.history,
  });

  final int id;
  final String title;
  final String description;
  final CVStatus status;
  final DateTime creationDate;
  final double rating;
  final List<CVTag> tags;
  final List<DateSortable> history;
}
