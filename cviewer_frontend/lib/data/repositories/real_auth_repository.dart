import 'package:cviewer_frontend/constants/storage_keys.dart';
import 'package:cviewer_frontend/data/mappers/profile_credentials_mapper.dart';
import 'package:cviewer_frontend/data/mappers/profile_mapper.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/exceptions/data_exception.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:cviewer_frontend/domain/repositories/auth_repository.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealAuthRepository implements AuthRepository {
  const RealAuthRepository(
    this._service,
    this._storage,
  );

  final CViewerService _service;
  final SharedPreferences _storage;

  static final _logger = Logger('AUTH REPO');

  @override
  Future<bool> checkAccess() async {
    // TODO: заменить на метод сервиса, который будет проверять время жизни токена
    final authToken = _storage.getString(StorageKeys.authToken);

    return authToken != null;
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
      _logger.info('Auth token was saved: $token');

      return const ProfileFromDtoMapper().map(profileDto);
    } else {
      throw const NoDataException();
    }
  }
}
