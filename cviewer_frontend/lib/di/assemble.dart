import 'package:cviewer_frontend/domain/repositories/auth_repository.dart';
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

class Assemble {
  Assemble._();

  static SharedPreferences get storage => _getIt.get();
  static AuthRepository get authRepository => _getIt.get(); 
  static ProfileRepository get profileRepository => _getIt.get();
  static CVRepository get cvRepository => _getIt.get();
}
