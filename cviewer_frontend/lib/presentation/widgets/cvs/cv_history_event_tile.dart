import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/resources/text_styles.dart';
import 'package:cviewer_frontend/utils/date_time_formatters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CVHistoryEventTile extends StatelessWidget {
  const CVHistoryEventTile({
    super.key,
    required this.event,
  });

  final CVHistoryEvent event;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile?>(context);

    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Author info
            Text(
              (event.author == profile)
                  ? S.of(context).you
                  : event.author.fullName,
            ),
            // Comment
            Text(
              event.comment ?? '',
              style: TextStyles.textL,
            ),
            // Date
            Text(
              DateTimeFormatters.formatTimeAndDate(event.creationDate),
              style: TextStyles.textM,
            ),
          ],
        ),
      ),
    );
  }
}
