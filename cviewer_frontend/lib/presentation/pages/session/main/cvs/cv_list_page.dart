import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_list_loader.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_list.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CVListPage extends StatefulWidget {
  const CVListPage({super.key});

  @override
  State<CVListPage> createState() => _CVListPageState();
}

class _CVListPageState extends State<CVListPage> {
  final _cvsLoader = CVListLoader();

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
        appBar: AppBar(
          title: Text(S.of(context).myCV),
          automaticallyImplyLeading: false,
        ),
        body: Observer(
          builder: (_) =>
              // Loading
              _cvsLoader.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _cvsLoader.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            context,
                            error: _cvsLoader.error,
                          ),
                          onReload: _onReload,
                        )
                      // Content
                      : CVList(
                          cvs: _cvsLoader.cvList,
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
