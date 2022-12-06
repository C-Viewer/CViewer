import 'package:cviewer_frontend/domain/models/cv/date_sortable.dart';

class CVFileInfo implements DateSortable {
  const CVFileInfo({
    required this.id,
    required this.fileName,
    required this.date,
  });

  final int id;
  final String fileName;

  @override
  final DateTime date;
}
