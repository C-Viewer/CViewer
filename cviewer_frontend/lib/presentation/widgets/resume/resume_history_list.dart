import 'package:cviewer_frontend/domain/models/resume/date_sortable.dart';
import 'package:cviewer_frontend/domain/models/resume/resume_comment_info.dart';
import 'package:cviewer_frontend/domain/models/resume/resume_file_info.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_comment_tile.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_file_tile.dart';
import 'package:flutter/material.dart';

class ResumeHistoryList extends StatelessWidget {
  const ResumeHistoryList({
    super.key,
    required this.items,
  });

  final List<DateSortable> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (_, i) {
        final item = items[i];

        return item is ResumeFileInfo
            ? ResumeFileTile(info: item)
            : item is ResumeCommentInfo
                ? ResumeCommentTile(info: item)
                : Container();
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
