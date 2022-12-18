import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/domain/models/file/file_info.dart';

class CV {
  const CV({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.creationDate,
    required this.tags,
    this.rating,
    this.pinnedFileInfo,
  });

  final int id;
  final String title;
  final String description;
  final CVStatus status;
  final DateTime creationDate;
  final List<CVTag> tags;
  final int? rating;
  final FileInfo? pinnedFileInfo;
}