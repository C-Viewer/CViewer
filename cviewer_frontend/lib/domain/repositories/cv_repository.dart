import 'package:cviewer_frontend/domain/models/cv/cv.dart';

abstract class CVRepository {
  Future<List<CV>> getCVs();
  Future<CV> getCV(int cvId);
}
