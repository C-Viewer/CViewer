import 'dart:async';
import 'dart:convert';

import 'package:cviewer_frontend/constants/storage_keys.dart';
import 'package:cviewer_frontend/data/network/service/base/c_viewer_service.models.swagger.dart';
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

  Future<Response> createCV({
    required Uint8List file,
    required CVDraftParameter data,
  }) async {
    final request = MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl/create_cv_for_review'),
    );

    request.files.addAll(
      [
        MultipartFile.fromBytes(
          'file',
          file,
          filename: data.fileName,
        ),
        MultipartFile.fromString(
          'cvDraft',
          jsonEncode(data.toJson()),
        ),
      ],
    );

    final response = await _send(request);

    return response;
  }

  Future<Response> createCVHistoryEvent({
    required Uint8List? file,
    required CVHistoryParameter data,
  }) async {
    final request = MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl/add_event_to_history'),
    );

    request.files.addAll(
      [
        if (file != null)
          MultipartFile.fromBytes(
            'file',
            file,
            filename: data.fileName,
          ),
        MultipartFile.fromString(
          'cvHistoryParameter',
          jsonEncode(data.toJson()),
        ),
      ],
    );

    final response = await _send(request);

    return response;
  }

  Future<Response> _send(BaseRequest request) async {
    final authToken = _storage.getString(StorageKeys.authToken);

    request.headers.addAll({
      'Authorization': 'Bearer $authToken',
    });

    final streamResponse = await _client.send(request);

    return Response.fromStream(streamResponse);
  }
}
