import 'package:cviewer_frontend/data/service/c_viewer_service.swagger.dart';
import 'package:cviewer_frontend/domain/models/profile/profile_credentials.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class ProfileCredentialsToDtoMapper implements Mapper<ProfileCredentials, UserCredentials> {
  const ProfileCredentialsToDtoMapper();
  
  @override
  UserCredentials map(ProfileCredentials data) {
    return UserCredentials(
      emailAddress: data.email,
      password: data.email,
    );
  }
}