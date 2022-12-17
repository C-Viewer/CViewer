import 'package:cviewer_frontend/domain/models/file/file_info.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';

class CVHistoryEvent {
  const CVHistoryEvent({
    required this.id,
    required this.creationDate,
    required this.author,
    this.comment,
    this.grade,
    this.fileInfo,
  });

  final int id;
  final DateTime creationDate;
  final Profile author;
  final String? comment;
  final double? grade;
  final FileInfo? fileInfo;
}
