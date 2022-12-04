import 'package:cviewer_frontend/domain/models/resume/date_sortable.dart';
import 'package:cviewer_frontend/domain/models/resume/resume_status.dart';
import 'package:cviewer_frontend/domain/models/tag/tag.dart';

class CV {
  const CV({
    required this.id,
    required this.title,
    required this.status,
    required this.tags,
    required this.history,
  });

  final int id;
  final String title;
  final ResumeStatus status;
  final List<Tag> tags;
  final List<DateSortable> history;
}
