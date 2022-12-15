import 'dart:convert';

import 'package:cviewer_frontend/constants/storage_keys.dart';
import 'package:cviewer_frontend/data/mappers/profile_mapper.dart';
import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.models.swagger.dart' as dto;
import 'package:cviewer_frontend/data/network/service/base/client_index.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealProfileRepository implements ProfileRepository {
  const RealProfileRepository(
    this._service,
    this._storage,
  );

  final CViewerService _service;
  final SharedPreferences _storage;

  @override
  Future<Profile> getProfile() async {
    final response = await _service.getProfileGet();
    final dto = response.body;

    if (dto != null) {
      return const ProfileFromDtoMapper().map(dto);
    } else {
      throw const NoDataError();
    }
  }

  @override
  Profile? getCachedProfile() {
    final profileJson = _storage.getString(StorageKeys.profile);
    if (profileJson != null) {
      final json = jsonDecode(profileJson);
      final profileDto = dto.Profile.fromJson(json);

      return const ProfileFromDtoMapper().map(profileDto);
    }
    return null;
  }
}
