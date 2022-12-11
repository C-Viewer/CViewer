import 'package:cviewer_frontend/domain/models/profile/profile.dart';

class CVHistoryEvent {
  const CVHistoryEvent({
    required this.id,
    required this.creationDate,
    required this.author,
    this.comment,
    this.grade,
    this.filePath,
  });

  final int id;
  final DateTime creationDate;
  final Profile author;
  final String? comment;
  final double? grade;
  final String? filePath;
}
