import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_history_event_tile.dart';
import 'package:flutter/material.dart';

class CVHistoryList extends StatelessWidget {
  const CVHistoryList({
    super.key,
    required this.cvHistory,
  });

  final CVHistory cvHistory;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: cvHistory.events.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) => CVHistoryEventTile(
        event: cvHistory.events[i],
      ),
    );
  }
}
