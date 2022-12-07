import 'package:cviewer_frontend/presentation/resources/text_styles.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_file_info.dart';
import 'package:cviewer_frontend/utils/date_time_formatters.dart';
import 'package:flutter/material.dart';

class CVFileTile extends StatelessWidget {
  const CVFileTile({
    super.key,
    required this.info,
  });

  final CVFileInfo info;

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
