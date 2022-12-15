import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_draft.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';

abstract class CVRepository {
  Future<List<CV>> getCVs();
  Future<CVHistory> getCVHistory(int cvId);
  Future<List<CVTag>> getTags();
  Future<CV> createDraftCV(CVDraft draft);
}
