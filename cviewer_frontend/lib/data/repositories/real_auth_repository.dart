import 'package:cviewer_frontend/constants/storage_keys.dart';
import 'package:cviewer_frontend/data/mappers/profile_credentials_mapper.dart';
import 'package:cviewer_frontend/data/mappers/profile_mapper.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:cviewer_frontend/domain/repositories/auth_repository.dart';
import 'package:cviewer_frontend/utils/loggers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealAuthRepository implements AuthRepository {
  const RealAuthRepository(
    this._service,
    this._storage,
  );

  final CViewerService _service;
  final SharedPreferences _storage;

  @override
  Future<void> checkAccess() async {
    await _service.checkAccessGet();
  }

  @override
  Future<Profile> signIn({
    required ProfileCredentials credentials,
  }) async {
    final response = await _service.signInPost(
      body: const ProfileCredentialsToDtoMapper().map(credentials),
    );
    final token = response.body?.token?.value;
    final profileDto = response.body?.profile;

    if (profileDto != null && token != null) {
      _storage.setString(StorageKeys.authToken, token);
      _storage.setString(StorageKeys.profile, profileDto.toString());
      Loggers.authRepository.info('Auth token was saved: $token');
      Loggers.authRepository.info('Profile was saved: $profileDto');

      return const ProfileFromDtoMapper().map(profileDto);
    } else {
      throw const NoDataError();
    }
  }
}
