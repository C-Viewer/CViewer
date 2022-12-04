import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:mobx/mobx.dart';

part 'profile_holder.g.dart';

class ProfileHolder = _ProfileHolder with _$ProfileHolder;

abstract class _ProfileHolder with Store {
  final _profileRepository = Assemble.profileRepository;

  @observable
  Profile? profile;

  @action
  Future<void> loadProfile() async {
    profile = await _profileRepository.getProfile();
  }
}
