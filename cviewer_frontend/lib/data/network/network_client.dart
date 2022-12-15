import 'package:chopper/chopper.dart';
import 'package:cviewer_frontend/data/network/converters/network_error_converter.dart';
import 'package:cviewer_frontend/data/network/interceptors/token_substitutor.dart';
import 'package:cviewer_frontend/data/network/service/c_viewer_service.swagger.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkClient {
  NetworkClient._();

  static Client fileServiceClient() {
    final httpClient = Client();

    return httpClient;
  }

  static ChopperClient serviceClient({
    required String baseUrl,
    required SharedPreferences storage,
  }) {
    return ChopperClient(
      baseUrl: baseUrl,
      converter: $JsonSerializableConverter(),
      errorConverter: const NetworkErrorConverter(),
      interceptors: [
        TokenSubstitutor(storage),
        if (!kReleaseMode) HttpLoggingInterceptor(),
        if (!kReleaseMode) CurlInterceptor(),
      ],
    );
  }
}
