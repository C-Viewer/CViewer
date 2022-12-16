import 'package:cviewer_frontend/domain/models/file/file_info.dart';

class CVHistoryEventData {
  const CVHistoryEventData({
    required this.cvId,
    required this.authorId,
    this.fileInfo,
    this.comment,
    this.grade,
  });

  final int cvId;
  final int authorId;
  final FileInfo? fileInfo;
  final String? comment;
  final int? grade;
}
