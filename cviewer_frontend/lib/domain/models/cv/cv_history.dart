import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';

class CVHistory {
  const CVHistory({
    required this.cv,
    required this.events,
    required this.applicant,
    required this.expert,
  });

  final CV cv;
  final List<CVHistoryEvent> events;
  final Profile applicant;
  final Profile? expert;
}
