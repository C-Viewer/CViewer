import 'package:flutter/foundation.dart';

class FileInfo {
  const FileInfo({
    required this.fileName,
    required this.file,
  });

  final String fileName;
  final Uint8List file;
}
