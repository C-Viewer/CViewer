import 'package:flutter/foundation.dart';

class FileData {
  const FileData({
    required this.fileName,
    required this.file,
  });

  final String fileName;
  final Uint8List file;
}
