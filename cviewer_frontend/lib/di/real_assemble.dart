import 'package:cviewer_frontend/data/network/network_client.dart';
import 'package:cviewer_frontend/data/network/service/base/client_index.dart';
import 'package:cviewer_frontend/data/network/service/file/file_c_viewer_service.dart';
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
  @injectable
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
  FileCViewerService fileService(
    String baseUrl,
    SharedPreferences storage,
  ) =>
      FileCViewerService(
        NetworkClient.fileServiceClient(),
        baseUrl,
        storage,
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
    SharedPreferences storage,
  ) =>
      RealProfileRepository(service, storage);

  @dev
  @prod
  @injectable
  CVRepository cvRepository(
    CViewerService service,
    FileCViewerService fileService,
  ) =>
      RealCVRepository(
        service,
        fileService,
      );
}
