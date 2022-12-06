import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'profile_loader.g.dart';

final _logger = Logger('Profile loader');

class ProfileLoader = _ProfileLoader with _$ProfileLoader;

abstract class _ProfileLoader with Store {
  final _profileRepository = Assemble.profileRepository;

  @observable
  Profile? profile;

  @observable
  bool isLoading = false;

  @observable
  bool hasLoadError = false;

  @observable
  Object? error;

  @action
  Future<void> loadProfile() async {
    isLoading = true;
    try {
      profile = await _profileRepository.getProfile();
      error = null;
      hasLoadError = false;
      _logger.info('Profile was loaded');
    } catch (e) {
      error = e;
      hasLoadError = true;
      _logger.warning('Error occured: $e');
    } finally {
      isLoading = false;
    }
  }
}
