import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';

abstract class CVRepository {
  Future<List<CV>> getCVs();
  Future<CV> getCV(int cvId);
  Future<List<CVTag>> getTags();
}
