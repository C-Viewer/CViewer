import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'auth_manager.g.dart';

class AuthManager = _AuthManager with _$AuthManager;

final _logger = Logger('Auth manager');

abstract class _AuthManager with Store {
  final _authRepository = Assemble.authRepository;

  @observable
  bool isAuthorized = false;

  @observable
  Object? error;

  @action
  Future<void> checkAccess() async {
    try {
      isAuthorized = await _authRepository.checkAccess();
      error = null;
      _logger.info('Profile has access to content');
    } catch (e) {
      error = e;
      isAuthorized = false;
      _logger.warning('Error occured on check access: $e');
    }
  }

  @action
  Future<void> signIn({
    required ProfileCredentials credentials,
  }) async {
    try {
      await _authRepository.signIn(
        credentials: credentials,
      );
      isAuthorized = true;
      error = null;
      _logger.info('Successful Sign In');
    } catch (e) {
      error = e;
      isAuthorized = false;
      _logger.warning('Error occured on sign in: $e');
    }
  }
}
