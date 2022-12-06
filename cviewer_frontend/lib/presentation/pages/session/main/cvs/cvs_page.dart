import 'package:cviewer_frontend/domain/logic/cv/cvs_loader.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/core/core_error_handler.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_list.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CVsPage extends StatefulWidget {
  const CVsPage({super.key});

  @override
  State<CVsPage> createState() => _CVsPageState();
}

class _CVsPageState extends State<CVsPage> {
  final _cvsLoader = CVsLoader();

  @override
  void initState() {
    super.initState();
    _cvsLoader.loadCVs();
  }

  void _onReload() {
    _cvsLoader.loadCVs();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) => coreErrorDisposer(
        context,
        (_) => _cvsLoader.error,
      ),
      child: Scaffold(
        body: Observer(
          builder: (_) =>
              // Loading
              _cvsLoader.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _cvsLoader.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            error: _cvsLoader.error,
                          ),
                          onReload: _onReload,
                        )
                      // Content
                      : CVList(
                          cvs: _cvsLoader.cvs,
                        ),
        ),
        floatingActionButton: Observer(
          builder: (_) => !_cvsLoader.isLoading && !_cvsLoader.hasLoadError
              ? FloatingActionButton(
                  onPressed: () {
                    // TODO: создание черновика CV
                  },
                  child: const Icon(
                    Icons.create_rounded,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
