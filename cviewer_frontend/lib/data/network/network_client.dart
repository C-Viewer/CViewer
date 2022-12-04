import 'package:chopper/chopper.dart';
import 'package:cviewer_frontend/data/network/service/c_viewer_service.swagger.dart';
import 'package:flutter/foundation.dart';

class NetworkClient {
  NetworkClient._();

  static ChopperClient serviceClient({
    required String baseUrl,
  }) {
    return ChopperClient(
      baseUrl: baseUrl,
      converter: $JsonSerializableConverter(),
      // errorConverter: const AppErrorConverter(),
      interceptors: [
        // TODO: token substitutor
        if (!kReleaseMode) HttpLoggingInterceptor(),
        if (!kReleaseMode) CurlInterceptor(),
      ],
    );
  }
}
