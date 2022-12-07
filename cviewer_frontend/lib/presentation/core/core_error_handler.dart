import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoreErrorHandler {
  const CoreErrorHandler();

  void onErrorOccured(BuildContext context, Object? error) {
    // TODO: show toast/snackbar
    if (error is NoAccessError) {
      context.replaceNamed(RouteNames.auth);
    }
  }
}
