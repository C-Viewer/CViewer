import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/models/exceptions/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoreErrorHandler {
  const CoreErrorHandler();

  void onErrorOccured(BuildContext context, Object? error) {
    // TODO: show toast/snackbar
    if (error is NoAccessException) {
      context.replaceNamed(RouteNames.auth);
    }
  }
}