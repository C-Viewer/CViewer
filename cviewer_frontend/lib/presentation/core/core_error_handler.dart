import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoreErrorHandler {
  const CoreErrorHandler();

  void onErrorOccured(BuildContext context, Object? error) async {
    if (error == null) {
      return;
    }

    final uiModel = ErrorUiAdapter(context, error: error);
    if (error is NoAccessError) {
      context.goNamed(RouteNames.auth);
      await Assemble.storage.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.red,
          content: Text(
            uiModel.errorText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
      );
    }
  }
}
