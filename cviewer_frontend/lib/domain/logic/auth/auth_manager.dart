import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:mobx/mobx.dart';

part 'auth_manager.g.dart';

class AuthManager = _AuthManager with _$AuthManager;

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
    } catch (e) {
      isAuthorized = false;
      error = e;
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
    } catch (e) {
      isAuthorized = false;
      error = e;
    }
  }
}
