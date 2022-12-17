import 'dart:math';

import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_history_event_creator.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_history_loader.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/pages/session/cv/cv_history_event_bottom_sheet.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/resources/decorations.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/cv_tags/cv_tag_group.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_file_label.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_history_list.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_status_label.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

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
  late final CVHistoryLoader _cvHistoryLoader;

  @override
  void initState() {
    super.initState();
    _cvHistoryLoader = CVHistoryLoader(cvId: widget.cvId);
    _cvHistoryLoader.loadCVHistory();
  }

  void _onReload() {
    _cvHistoryLoader.loadCVHistory();
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
                          cvHistoryLoader: _cvHistoryLoader,
                        ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.cvHistory,
    required this.cvHistoryLoader,
  });

  final CVHistory cvHistory;
  final CVHistoryLoader cvHistoryLoader;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile?>(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                if (cvHistory.cv.pinnedFileName != null &&
                    cvHistory.cv.pinnedFileUrl != null) ...[
                  CVFileLabel(
                    fileName: cvHistory.cv.pinnedFileName!,
                    fileUrl: cvHistory.cv.pinnedFileUrl!,
                  ),
                  const SizedBox(height: 15),
                ],
                // History
                CVHistoryList(
                  cvHistory: cvHistory,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: Decorations.buttonPanel,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Comment button
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: min(
                    MediaQuery.of(context).size.width * 0.4,
                    500,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    final isUpdated = await CVHistoryEventBottomSheet.show(
                      context,
                      enableGrade: profile?.isExpert == true,
                      enableFileAttachment: profile?.isExpert == false,
                      eventCreator: CVHistoryEventCreator(
                        cvId: cvHistory.cv.id,
                        authorId: profile!.id,
                      ),
                    );
                    if (isUpdated == true) {
                      cvHistoryLoader.loadCVHistory();
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.mint),
                  ),
                  child: Text(
                    S.of(context).comment.toUpperCase(),
                  ),
                ),
              ),
              // Finish button
              if (profile?.isExpert == false &&
                  cvHistory.cv.status != CVStatus.finished) ...[
                const SizedBox(width: 30),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: min(
                      MediaQuery.of(context).size.width * 0.4,
                      500,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: cvHistoryLoader.finishReview,
                    child: Text(
                      S.of(context).finish.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
