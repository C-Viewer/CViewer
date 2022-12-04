import 'dart:async';

import 'package:chopper/chopper.dart';

class NetworkErrorConverter implements ErrorConverter {
  const NetworkErrorConverter();

  @override
  FutureOr<Response> convertError<BodyType, InnerType>(
    Response response,
  ) async {
    return response;
  }
}
