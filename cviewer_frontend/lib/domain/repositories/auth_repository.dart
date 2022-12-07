import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';

// TODO: добавить signUp метод
abstract class AuthRepository {
  Future<void> checkAccess();

  Future<Profile> signIn({
    required ProfileCredentials credentials,
  });
}
