import 'package:cviewer_frontend/data/repositories/mock_profile_repository.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class MockAssemble {
  @test
  @injectable
  ProfileRepository profileRepository() => const MockProfileRepository();
}
