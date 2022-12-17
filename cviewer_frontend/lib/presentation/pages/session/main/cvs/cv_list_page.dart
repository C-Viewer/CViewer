import 'dart:math';

import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_list_loader.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_list_type.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/resources/decorations.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_list.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CVListPage extends StatefulWidget {
  const CVListPage({
    super.key,
    required this.title,
    required this.type,
  });

  final String title;
  final CVListType type;

  @override
  State<CVListPage> createState() => _CVListPageState();
}

class _CVListPageState extends State<CVListPage> {
  late final CVListLoader _cvsLoader;

  @override
  void initState() {
    super.initState();
    _cvsLoader = CVListLoader(type: widget.type);
    _cvsLoader.loadCVs();
  }

  void _onReload() {
    _cvsLoader.loadCVs();
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile?>(context);
    final isExpert = profile?.isExpert ?? false;

    return ReactionBuilder(
      builder: (_) => coreErrorDisposer(
        context,
        (_) => _cvsLoader.error,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // List
                            Expanded(
                              child: CVList(
                                cvs: _cvsLoader.cvList,
                                type: widget.type,
                              ),
                            ),
                            // Button panel
                            if (!isExpert && widget.type == CVListType.myCVs)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                decoration: Decorations.buttonPanel,
                                child: Center(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                      width: min(
                                        MediaQuery.of(context).size.width * 0.5,
                                        500,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => context.pushNamed(
                                        RouteNames.cvCreator,
                                      ),
                                      child: Text(
                                        S.of(context).createCV.toUpperCase(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
        ),
      ),
    );
  }
}
