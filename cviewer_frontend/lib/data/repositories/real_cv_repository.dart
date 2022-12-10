import 'package:cviewer_frontend/data/mappers/cv_mapper.dart';
import 'package:cviewer_frontend/data/mappers/cv_tag_mapper.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_tag.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart';

class RealCVRepository implements CVRepository {
  const RealCVRepository(this._service);

  final CViewerService _service;

  @override
  Future<List<CV>> getCVs() async {
    final response = await _service.listCVsGet();
    final dto = response.body;

    if (dto != null) {
      return dto.map(const CVFromDtoMapper().map).toList();
    } else {
      throw const NoDataError();
    }
  }

  @override
  Future<CV> getCV(int cvId) async {
    final response = await _service.getCvGet(
      cvId: cvId,
    );
    final dto = response.body;

    if (dto != null) {
      return const CVFromDtoMapper().map(dto);
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
}
