import 'dart:convert';

import 'package:cviewer_frontend/data/network/service/client_index.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart';

class RealProfileRepository implements ProfileRepository {
  const RealProfileRepository(this._service);

  final CViewerService _service;

  @override
  Future<Profile> getProfile() async {
    // TODO: избавиться от profileId
    final response = await _service.getProfileGet(profileId: 1);
    final profile = jsonDecode(response.bodyString);

    // TODO: использовать маппер, когда появится схема
    return Profile(
      id: profile['id'],
      firstName: profile['firstName'],
      lastName: profile['lastName'],
      description: profile['biography'],
    );
  }
}
