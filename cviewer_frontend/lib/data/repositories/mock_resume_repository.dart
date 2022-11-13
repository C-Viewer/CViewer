import 'package:cviewer_frontend/domain/models/resume/resume_comment_info.dart';
import 'package:cviewer_frontend/domain/models/resume/resume_file_info.dart';
import 'package:cviewer_frontend/domain/models/resume/resume.dart';
import 'package:cviewer_frontend/domain/models/resume/resume_status.dart';
import 'package:cviewer_frontend/domain/models/tag/tag.dart';
import 'package:cviewer_frontend/domain/repositories/resume_repository.dart';

class MockResumeRepository implements ResumeRepository {
  const MockResumeRepository();

  @override
  Future<List<Resume>> getResumeList() async {
    return _mockResumeList;
  }

  @override
  Future<Resume> getResume(int resumeId) async {
    return _mockResumeList.firstWhere((it) => it.id == resumeId);
  }
}

final _mockResumeList = [
  Resume(
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
  Resume(
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
  const Resume(
    id: 3,
    title: 'Resume title 3',
    status: ResumeStatus.onReview,
    tags: [],
    history: [],
  ),
  const Resume(
    id: 4,
    title: 'Resume title 4',
    status: ResumeStatus.fixRequired,
    tags: [],
    history: [],
  ),
  const Resume(
    id: 5,
    title: 'Resume title 5',
    status: ResumeStatus.marked,
    tags: [],
    history: [],
  ),
  const Resume(
    id: 6,
    title: 'Resume title 6',
    status: ResumeStatus.finished,
    tags: [],
    history: [],
  ),
];
