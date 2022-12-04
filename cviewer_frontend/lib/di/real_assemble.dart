import 'package:cviewer_frontend/data/network/network_client.dart';
import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/data/repositories/real_profile_repository.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RealAssemble {
  @dev
  @prod
  String baseUrl() => 'http://localhost:5000';

  @dev
  @prod
  @injectable
  CViewerService service(
    String baseUrl,
  ) =>
      CViewerService.create(
        client: NetworkClient.serviceClient(
          baseUrl: baseUrl,
        ),
      );

  @dev
  @prod
  @injectable
  ProfileRepository profileRepository(
    CViewerService service,
  ) =>
      RealProfileRepository(service);
}
