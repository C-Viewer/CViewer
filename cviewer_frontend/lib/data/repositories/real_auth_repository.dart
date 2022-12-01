import 'package:cviewer_frontend/data/mappers/profile_credentials_mapper.dart';
import 'package:cviewer_frontend/data/repositories/mock_profile_repository.dart';
import 'package:cviewer_frontend/data/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:cviewer_frontend/domain/repositories/auth_repository.dart';

class RealAuthRepository implements AuthRepository {
  const RealAuthRepository(this._service);

  final CViewerService _service;

  @override
  Future<Profile> signIn({
    required ProfileCredentials credentials,
  }) async {
    final response = await _service.signInPost(
      body: const ProfileCredentialsToDtoMapper().map(credentials),
    );

    // TODO: возвращать реальный профиль
    return const MockProfileRepository().getProfile();
  }
}
