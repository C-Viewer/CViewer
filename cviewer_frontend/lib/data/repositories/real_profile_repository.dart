import 'package:cviewer_frontend/data/mappers/profile_mapper.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/exceptions/data_exception.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';

class RealProfileRepository implements ProfileRepository {
  const RealProfileRepository(this._service);

  final CViewerService _service;

  @override
  Future<Profile> getProfile() async {
    // TODO: избавиться от profileId
    final response = await _service.getProfileGet(profileId: 1);
    final dto = response.body;

    if (dto != null) {
      return const ProfileFromDtoMapper().map(dto);
    } else {
      throw const NoDataException();
    }
  }
}
