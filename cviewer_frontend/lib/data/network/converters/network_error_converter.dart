import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';

class NetworkErrorConverter implements ErrorConverter {
  const NetworkErrorConverter();

  @override
  FutureOr<Response> convertError<BodyType, InnerType>(
    Response response,
  ) async {
    switch (response.statusCode) {
      case 401:
        throw NoAccessError();
      case 404:
        throw NoFoundError();
    }
    return response;
  }
}
