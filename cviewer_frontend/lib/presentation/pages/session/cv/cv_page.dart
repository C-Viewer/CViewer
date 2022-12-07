import 'package:cviewer_frontend/domain/logic/cv/cv_loader.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/resources/text_styles.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_history_list.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CVPage extends StatefulWidget {
  const CVPage({
    super.key,
    required this.cvId,
  });

  final int cvId;

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  final _cvLoader = CVLoader();

  @override
  void initState() {
    super.initState();
    _cvLoader.loadCV(widget.cvId);
  }

  void _onReload() {
    _cvLoader.loadCV(widget.cvId);
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) => coreErrorDisposer(
        context,
        (_) => _cvLoader.error,
      ),
      child: Scaffold(
        body: Observer(
          builder: (_) =>
              // Loading
              _cvLoader.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _cvLoader.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            context,
                            error: _cvLoader.error,
                          ),
                          onReload: _onReload,
                        )
                      // Content
                      : _Content(
                          cv: _cvLoader.cv!,
                        ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.cv,
  });

  final CV cv;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(36),
      child: Column(
        children: [
          // Title
          Text(
            cv.title,
            style: TextStyles.titleXXL,
          ),
          const SizedBox(height: 20),
          // History
          CVHistoryList(
            items: cv.history,
          ),
        ],
      ),
    );
  }
}
