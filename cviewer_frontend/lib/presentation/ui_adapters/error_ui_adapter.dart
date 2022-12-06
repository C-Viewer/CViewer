import 'package:cviewer_frontend/domain/models/exceptions/exceptions.dart';
import 'package:cviewer_frontend/presentation/ui_models/error_ui_model.dart';

class ErrorUiAdapter implements ErrorUiModel {
  const ErrorUiAdapter({
    required this.error,
  });

  final Object? error;

  @override
  String get errorText {
    switch (error.runtimeType) {
      case NoAccessException:
        return 'You dont have access, please try to auth again';
      case NoDataException:
        return 'Unable to load data, please try again';
      default:
        return 'Unknown error';
    }
  }
}
