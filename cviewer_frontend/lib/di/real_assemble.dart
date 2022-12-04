import 'package:cviewer_frontend/data/network/network_client.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/data/repositories/real_auth_repository.dart';
import 'package:cviewer_frontend/data/repositories/real_cv_repository.dart';
import 'package:cviewer_frontend/data/repositories/real_profile_repository.dart';
import 'package:cviewer_frontend/di/di.dart';
import 'package:cviewer_frontend/domain/repositories/auth_repository.dart';
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RealAssemble {
  @dev
  @prod
  String baseUrl() => 'http://localhost:5000';

  @dev
  @prod
  @injectable
  SharedPreferences storage() => DI.storage;

  @dev
  @prod
  @injectable
  CViewerService service(
    String baseUrl,
    SharedPreferences storage,
  ) =>
      CViewerService.create(
        client: NetworkClient.serviceClient(
          baseUrl: baseUrl,
          storage: storage,
        ),
      );

  @dev
  @prod
  @injectable
  AuthRepository authRepository(
    CViewerService service,
    SharedPreferences storage,
  ) =>
      RealAuthRepository(service, storage);

  @dev
  @prod
  @injectable
  ProfileRepository profileRepository(
    CViewerService service,
  ) =>
      RealProfileRepository(service);

  @dev
  @prod
  @injectable
  CVRepository cvRepository(
    CViewerService service,
  ) =>
      RealCVRepository(service);
}
