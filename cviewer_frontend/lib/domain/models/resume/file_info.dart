import 'package:cviewer_frontend/domain/models/resume/date_sortable.dart';

class FileInfo implements DateSortable {
  const FileInfo({
    required this.id,
    required this.fileName,
    required this.date,
  });

  final int id;
  final String fileName;

  @override
  final DateTime date;
}
