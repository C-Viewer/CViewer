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
import 'package:cviewer_frontend/domain/models/cv/cv_data.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history_event_data.dart';
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
      throw NoDataError();
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
      final applicant = await _getProfile(applicantId);
      final expert = (expertId != null) ? await _getProfile(expertId) : null;

      return CVHistory(
        cv: const CVFromDtoMapper().map(dto),
        events: await _getCVHistoryEvents(dto.id, applicant, expert),
        applicant: applicant,
        expert: expert,
      );
    } else {
      throw NoDataError();
    }
  }

  @override
  Future<List<CVTag>> getTags() async {
    final response = await _service.listCVTagsGet();
    final dto = response.body;

    if (dto != null) {
      return dto.map(const CVTagFromDtoMapper().map).toList();
    } else {
      throw NoDataError();
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
                author: (expert != null && it.authorId == expert.id)
                    ? expert
                    : applicant,
              ).map(it))
          .toList();
    } else {
      throw NoDataError();
    }
  }

  @override
  Future<void> createCV(CVData cvData) async {
    await _fileService.createCV(
      file: cvData.file,
      data: dto.CVDraftParameter(
        title: cvData.title,
        tags: cvData.tags.map((it) => it.id).toList(),
        fileName: cvData.fileName,
      ),
    );
  }

  @override
  Future<void> createHistoryEvent(CVHistoryEventData eventData) async {
    await _fileService.createCVHistoryEvent(
      file: eventData.fileInfo?.file,
      data: dto.CVHistoryParameter(
        cvId: eventData.cvId,
        authorId: eventData.authorId,
        fileName: eventData.fileInfo?.fileName,
        comment: eventData.comment,
        grade: eventData.grade?.toDouble(),
      ),
    );
  }

  @override
  Future<void> finishReview(int cvId) async {
    await _service.finishCvReviewPut(cvId: cvId);
  }

  Future<Profile> _getProfile(int profileId) async {
    final response = await _service.getProfileByIdGet(
      profileId: profileId,
    );
    final dto = response.body;

    if (dto != null) {
      return const ProfileFromDtoMapper().map(dto);
    } else {
      throw NoDataError();
    }
  }
}
