import 'package:cviewer_frontend/assets/images/image_paths.dart';
import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/presentation/ui_models/error_ui_model.dart';
import 'package:flutter/material.dart';

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
    final width = MediaQuery.of(context).size.width * 0.4;

    return Center(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Image
            Expanded(
              child: Image.asset(
                ImagePaths.loadErrorPlaceholder,
              ),
            ),
            const SizedBox(height: 20),
            // Error message
            Text(
              error.errorText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20),
            // Button
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: ElevatedButton(
                onPressed: onReload,
                child: Text(
                  S.of(context).tryAgain.toUpperCase(),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
