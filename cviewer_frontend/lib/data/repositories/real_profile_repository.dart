import 'package:cviewer_frontend/data/repositories/mock_profile_repository.dart';
import 'package:cviewer_frontend/data/service/c_viewer_service.swagger.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';

class RealProfileRepository implements ProfileRepository {
  const RealProfileRepository(this._service);
  
  final CViewerService _service;
  
  @override
  Future<Profile> getProfile() async {
    // TODO: избавиться от profileId
    final response = await _service.getProfileGet(profileId: 1);

    return const MockProfileRepository().getProfile();
  }
}
