import 'dart:async';
import 'dart:convert';

import 'package:cviewer_frontend/constants/storage_keys.dart';
import 'package:cviewer_frontend/data/network/service/c_viewer_service.models.swagger.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileCViewerService {
  const FileCViewerService(
    this._client,
    this._baseUrl,
    this._storage,
  );

  final Client _client;
  final String _baseUrl;
  final SharedPreferences _storage;

  Future<Response> uploadFile({
    required String path,
    required ComplexCVAndIFormFile draft,
    required Uint8List file,
  }) async {
    final request = MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl$path'),
    );

    request.files.addAll(
      [
        MultipartFile.fromBytes(
          'file',
          file,
        ),
        MultipartFile.fromString(
          'cvDraft',
          jsonEncode(draft.cvDraft?.toJson()),
        ),
      ],
    );

    final authToken = _storage.getString(StorageKeys.authToken);

    request.headers.addAll({
      'Authorization': 'Bearer $authToken',
    });

    final response = await _send(request);

    return response;
  }

  Future<Response> _send(BaseRequest request) async {
    final streamResponse = await _client.send(request);

    return Response.fromStream(streamResponse);
  }
}
