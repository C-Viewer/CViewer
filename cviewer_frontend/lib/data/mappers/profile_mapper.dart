import 'package:cviewer_frontend/data/network/service/c_viewer_service.models.swagger.dart'
    as dto;
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/utils/mapper.dart';

class ProfileFromDtoMapper implements Mapper<dto.Profile, Profile> {
  const ProfileFromDtoMapper();

  @override
  Profile map(dto.Profile data) {
    return Profile(
      id: data.id ?? 0,
      firstName: data.firstName ?? '',
      lastName: data.lastName ?? '',
      biography: data.biography ?? '',
      rating: data.rating ?? 0.0,
      isExpert: data.isExpert ?? false,
      speciality: data.specializationId?.toString() ?? '',
    );
  }
}
