import 'package:cviewer_frontend/domain/models/resume/cv.dart';

abstract class CVRepository {
  Future<List<CV>> getCVs();
  Future<CV> getCV(int cvId);
}
