import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/models/errors.dart';
import 'package:cviewer_frontend/presentation/ui_models/error_ui_model.dart';
import 'package:flutter/widgets.dart';

class ErrorUiAdapter implements ErrorUiModel {
  const ErrorUiAdapter(
    this.context, {
    required this.error,
  });

  final BuildContext context;
  final Object? error;

  @override
  String get errorText {
    switch (error.runtimeType) {
      case NoAccessError:
        return S.of(context).noAccessError;
      case NoDataError:
        return S.of(context).noDataError;
      default:
        return S.of(context).unknownError;
    }
  }
}
