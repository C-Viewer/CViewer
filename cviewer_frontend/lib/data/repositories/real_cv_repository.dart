import 'package:cviewer_frontend/data/mappers/cv_mapper.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/exceptions/exceptions.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
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
      throw const NoDataException();
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
      throw const NoDataException();
    }
  }
}
