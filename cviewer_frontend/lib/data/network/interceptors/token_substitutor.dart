import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:cviewer_frontend/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSubstitutor implements RequestInterceptor {
  const TokenSubstitutor(this._storage);

  final SharedPreferences _storage;

  @override
  FutureOr<Request> onRequest(Request request) {
    final authToken = _storage.getString(StorageKeys.authToken);

    return request.copyWith(
      headers: {
        ...request.headers,
        'Authorization': 'Bearer $authToken',
      },
    );
  }
}
