import 'package:cviewer_frontend/domain/models/cv/cv_comment_info.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_file_info.dart';
import 'package:cviewer_frontend/domain/models/cv/date_sortable.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_comment_tile.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_file_tile.dart';
import 'package:flutter/material.dart';

class CVHistoryList extends StatelessWidget {
  const CVHistoryList({
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

        return item is CVFileInfo
            ? CVFileTile(info: item)
            : item is CVCommentInfo
                ? CVCommentTile(info: item)
                : Container();
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
