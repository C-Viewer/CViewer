import 'package:cviewer_frontend/domain/models/resume/resume_file_info.dart';
import 'package:cviewer_frontend/constants/text_styles.dart';
import 'package:cviewer_frontend/utils/date_time_formatters.dart';
import 'package:flutter/material.dart';

class ResumeFileTile extends StatelessWidget {
  const ResumeFileTile({
    super.key,
    required this.info,
  });

  final ResumeFileInfo info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Comment
        Text(
          info.fileName,
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
