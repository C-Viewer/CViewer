import 'package:cviewer_frontend/domain/models/file/file_data.dart';

class CVHistoryEventData {
  const CVHistoryEventData({
    required this.cvId,
    required this.authorId,
    this.fileData,
    this.comment,
    this.grade,
  });

  final int cvId;
  final int authorId;
  final FileData? fileData;
  final String? comment;
  final int? grade;
}
