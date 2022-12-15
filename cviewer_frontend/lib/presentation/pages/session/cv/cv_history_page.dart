import 'package:cviewer_frontend/domain/logic/cv/cv_history_loader.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cv_tags/cv_tag_group.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_history_list.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_status_label.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CVHistoryPage extends StatefulWidget {
  const CVHistoryPage({
    super.key,
    required this.cvId,
  });

  final int cvId;

  @override
  State<CVHistoryPage> createState() => _CVHistoryPageState();
}

class _CVHistoryPageState extends State<CVHistoryPage> {
  final _cvHistoryLoader = CVHistoryLoader();

  @override
  void initState() {
    super.initState();
    _cvHistoryLoader.loadCVHistory(widget.cvId);
  }

  void _onReload() {
    _cvHistoryLoader.loadCVHistory(widget.cvId);
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) => coreErrorDisposer(
        context,
        (_) => _cvHistoryLoader.error,
      ),
      child: Observer(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(
              _cvHistoryLoader.cvHistory?.cv.title ?? '',
            ),
          ),
          body:
              // Loading
              _cvHistoryLoader.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _cvHistoryLoader.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            context,
                            error: _cvHistoryLoader.error,
                          ),
                          onReload: _onReload,
                        )
                      // Content
                      : _Content(
                          cvHistory: _cvHistoryLoader.cvHistory!,
                        ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.cvHistory,
  });

  final CVHistory cvHistory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(36),
      child: Column(
        children: [
          // Header
          CVStatusLabel(
            status: cvHistory.cv.status,
          ),
          const SizedBox(height: 15),
          CVTagGroup(
            tags: cvHistory.cv.tags,
          ),
          const SizedBox(height: 15),
          // History
          CVHistoryList(
            cvHistory: cvHistory,
          ),
        ],
      ),
    );
  }
}
