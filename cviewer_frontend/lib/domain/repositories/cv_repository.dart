import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_data.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event_data.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_list_type.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';

abstract class CVRepository {
  Future<List<CV>> getCVs(CVListType type);
  Future<CVHistory> getCVHistory(int cvId, CVListType type);
  Future<List<CVTag>> getTags();
  Future<void> createCV(CVData cvData);
  Future<void> createHistoryEvent(CVHistoryEventData eventData);
  Future<void> finishReview(int cvId);
}
