import 'dart:typed_data';

import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';

class CVData {
  const CVData({
    required this.title,
    required this.tags,
    required this.fileName,
    required this.file,
  });

  final String title;
  final List<CVTag> tags;
  final String fileName;
  final Uint8List file;
}
