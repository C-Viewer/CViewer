import 'package:cviewer_frontend/domain/models/resume/resume.dart';

abstract class ResumeRepository {
  Future<List<Resume>> getResumeList();
}
