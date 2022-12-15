import 'package:collection/collection.dart';
import 'package:cviewer_frontend/data/mappers/cv_history_event_mapper.dart';
import 'package:cviewer_frontend/data/mappers/cv_mapper.dart';
import 'package:cviewer_frontend/data/mappers/cv_tag_mapper.dart';
import 'package:cviewer_frontend/data/mappers/profile_mapper.dart';
import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.models.swagger.dart'
    as dto;
import 'package:cviewer_frontend/data/network/service/base/client_index.dart';
import 'package:cviewer_frontend/data/network/service/file/file_c_viewer_service.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_draft.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart';

class RealCVRepository implements CVRepository {
  const RealCVRepository(
    this._service,
    this._fileService,
  );

  final CViewerService _service;
  final FileCViewerService _fileService;

  @override
  Future<List<CV>> getCVs() async {
    final response = await _service.listCVsForProfileGet();
    final dto = response.body;

    if (dto != null) {
      return dto.map(const CVFromDtoMapper().map).toList();
    } else {
      throw const NoDataError();
    }
  }

  @override
  Future<CVHistory> getCVHistory(int cvId) async {
    final response = await _service.getCvGet(
      cvId: cvId,
    );
    final dto = response.body;

    if (dto != null) {
      final applicantId = dto.peopleCreatedId;
      final expertId = dto.expertIds?.firstOrNull;
      final applicant = await _getProfile(applicantId, false);
      final expert =
          (expertId != null) ? await _getProfile(expertId, true) : null;

      return CVHistory(
        cv: const CVFromDtoMapper().map(dto),
        events: await _getCVHistoryEvents(dto.id, applicant, expert),
        applicant: applicant,
        expert: expert,
      );
    } else {
      throw const NoDataError();
    }
  }

  @override
  Future<List<CVTag>> getTags() async {
    final response = await _service.listCVTagsGet();
    final dto = response.body;

    if (dto != null) {
      return dto.map(const CVTagFromDtoMapper().map).toList();
    } else {
      throw const NoDataError();
    }
  }

  Future<List<CVHistoryEvent>> _getCVHistoryEvents(
    int cvId,
    Profile applicant,
    Profile? expert,
  ) async {
    final response = await _service.listConcreteCVHistoriesGet(
      cvId: cvId,
    );
    final dto = response.body;

    if (dto != null) {
      return dto
          .map((it) => CVHistoryEventFromDtoMapper(
                author: (it.expertId == null || expert == null)
                    ? applicant
                    : expert,
              ).map(it))
          .toList();
    } else {
      throw const NoDataError();
    }
  }

  @override
  Future<void> createCV(CVDraft draft) async {
    await _fileService.uploadFile(
      path: '/create_cv_for_review',
      draft: dto.ComplexCVAndIFormFile(
        cvDraft: dto.CVDraftParameter(
          title: draft.title,
          tags: draft.tags.map((it) => it.id).toList(),
          fileName: draft.fileName,
        ),
      ),
      file: draft.file,
    );
  }

  Future<Profile> _getProfile(int profileId, bool isExpert) async {
    final response = isExpert
        ? await _service.getExpertProfileGet(expertId: profileId)
        : await _service.getApplicantProfileGet(applicantId: profileId);
    final dto = response.body;

    if (dto != null) {
      return const ProfileFromDtoMapper().map(dto);
    } else {
      throw const NoDataError();
    }
  }
}
