import 'package:cviewer_frontend/domain/models/resume/resume_comment_info.dart';
import 'package:cviewer_frontend/presentation/resources/text_styles.dart';
import 'package:cviewer_frontend/utils/date_time_formatters.dart';
import 'package:flutter/material.dart';

class ResumeCommentTile extends StatelessWidget {
  const ResumeCommentTile({
    super.key,
    required this.info,
  });

  final ResumeCommentInfo info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Comment
        Text(
          info.comment,
          style: TextStyles.textL,
        ),
        // Date
        Text(
          DateTimeFormatters.hourMinuteDayMonthYearFormat.format(info.date),
          style: TextStyles.textM,
        ),
      ],
    );
  }
}
