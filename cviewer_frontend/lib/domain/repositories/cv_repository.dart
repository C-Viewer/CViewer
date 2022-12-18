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
  Future<void> createCVHistoryEvent(CVHistoryEventData eventData);
  Future<void> startCVReview(int cvId);
  Future<void> finishCVReview(int cvId);
  Future<void> markCVAsBest(int cvId);
  Future<void> markExpert({
    required int experdId,
    required int authorId,
    required int grade,
    String? comment,
  });
}
