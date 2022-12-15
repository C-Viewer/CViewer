import 'dart:html';

import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CVFileLabel extends StatelessWidget {
  const CVFileLabel({
    super.key,
    required this.fileName,
    required this.fileUrl,
  });

  final String fileName;
  final String fileUrl;

  void _onPressed() {
    final anchorElement = AnchorElement(href: fileUrl);
    anchorElement.download = fileUrl;
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_download_outlined,
            color: AppColors.black,
          ),
          const SizedBox(width: 8),
          Text(
            fileName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
