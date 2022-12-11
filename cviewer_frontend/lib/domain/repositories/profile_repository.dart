import 'package:cviewer_frontend/domain/models/profile/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
  Profile? getCachedProfile();
}
