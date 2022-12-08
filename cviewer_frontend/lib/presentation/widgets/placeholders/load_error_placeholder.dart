import 'package:cviewer_frontend/presentation/ui_models/error_ui_model.dart';
import 'package:flutter/material.dart';

// TODO: кастомизировать UI при ошибке загрузки данных
// TODO: возможность релоадинга через кнопку
class LoadErrorPlaceholder extends StatelessWidget {
  const LoadErrorPlaceholder({
    super.key,
    required this.error,
    required this.onReload,
  });

  final ErrorUiModel error;
  final void Function() onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.errorText,
      ),
    );
  }
}
