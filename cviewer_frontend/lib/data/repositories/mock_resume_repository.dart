import 'package:cviewer_frontend/domain/models/resume/cv.dart';
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart';

class MockResumeRepository implements CVRepository {
  const MockResumeRepository();

  @override
  Future<List<CV>> getCVs() async {
    return _mockResumeList;
  }

  @override
  Future<CV> getCV(int resumeId) async {
    return _mockResumeList.firstWhere((it) => it.id == resumeId);
  }
}

final _mockResumeList = <CV>[
/*
  CV(
    id: 1,
    title: 'Resume title 1',
    status: ResumeStatus.draft,
    tags: [
      const Tag(
        id: 1,
        name: 'Tag 1',
      ),
      const Tag(
        id: 2,
        name: 'Tag 2',
      ),
      const Tag(
        id: 3,
        name: 'Tag 3',
      ),
    ],
    history: [
      ResumeCommentInfo(
        comment: 'New comment',
        date: DateTime(2022, 11, 13),
      ),
      ResumeFileInfo(
        id: 11,
        fileName: 'new_resume.pdf',
        date: DateTime(2022, 11, 13),
      ),
      ResumeCommentInfo(
        comment: 'Old comment',
        date: DateTime(2022, 11, 10),
      ),
      ResumeFileInfo(
        id: 12,
        fileName: 'resume.pdf',
        date: DateTime(2022, 11, 10),
      ),
    ],
  ),
  CV(
    id: 2,
    title: 'Resume title 2',
    status: ResumeStatus.opened,
    tags: [
      const Tag(
        id: 2,
        name: 'Tag 2',
      ),
      const Tag(
        id: 1,
        name: 'Tag 1',
      ),
    ],
    history: [
      ResumeCommentInfo(
        comment: 'New comment',
        date: DateTime(2022, 11, 13),
      ),
      ResumeFileInfo(
        id: 21,
        fileName: 'new_resume.pdf',
        date: DateTime(2022, 11, 13),
      ),
    ],
  ),
  const CV(
    id: 3,
    title: 'Resume title 3',
    status: ResumeStatus.onReview,
    tags: [],
    history: [],
  ),
  const CV(
    id: 4,
    title: 'Resume title 4',
    status: ResumeStatus.fixRequired,
    tags: [],
    history: [],
  ),
  const CV(
    id: 5,
    title: 'Resume title 5',
    status: ResumeStatus.marked,
    tags: [],
    history: [],
  ),
  const CV(
    id: 6,
    title: 'Resume title 6',
    status: ResumeStatus.finished,
    tags: [],
    history: [],
  ),
  */
];
