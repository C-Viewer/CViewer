import 'dart:math';

import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_finish_reporter.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_history_event_creator.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_history_loader.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_history.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_list_type.dart';
import 'package:cviewer_frontend/domain/models/cv/cv_status.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/pages/session/cv/cv_finish_bottom_sheet.dart';
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
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CVHistoryPage extends StatefulWidget {
  const CVHistoryPage({
    super.key,
    required this.cvId,
    required this.type,
  });

  final int cvId;
  final CVListType type;

  @override
  State<CVHistoryPage> createState() => _CVHistoryPageState();
}

class _CVHistoryPageState extends State<CVHistoryPage> {
  late final CVHistoryLoader _cvHistoryLoader;

  @override
  void initState() {
    super.initState();
    _cvHistoryLoader = CVHistoryLoader(
      cvId: widget.cvId,
      type: widget.type,
    );
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
                          type: widget.type,
                          onReviewStarted: (cvId) => context.replaceNamed(
                            RouteNames.cvHistory,
                            params: {
                              RouteParams.cvId: cvId.toString(),
                            },
                            extra: CVListType.myCVs,
                          ),
                          onReviewFinished: () {
                            final cvHistory = _cvHistoryLoader.cvHistory!;
                            final expertId = cvHistory.expert?.id;
                            if (expertId != null) {
                              CVFinishBottomSheet.show(
                                context,
                                reporter: CVFinishReporter(
                                  cvId: cvHistory.cv.id,
                                  authorId: cvHistory.applicant.id,
                                  expertId: expertId,
                                ),
                                showAgreement: (cvHistory.cv.grade ?? 0) >= 4,
                              );
                            }
                          },
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
    required this.type,
    required this.onReviewStarted,
    required this.onReviewFinished,
  });

  final CVHistory cvHistory;
  final CVHistoryLoader cvHistoryLoader;
  final CVListType type;
  final void Function(int cvId) onReviewStarted;
  final void Function() onReviewFinished;

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
                // Status
                CVStatusLabel(
                  status: cvHistory.cv.status,
                ),
                const SizedBox(height: 15),
                // Tags
                if (cvHistory.cv.tags.isNotEmpty) ...[
                  CVTagGroup(
                    tags: cvHistory.cv.tags,
                  ),
                  const SizedBox(height: 15),
                ],
                // File info
                if (cvHistory.cv.pinnedFileInfo != null) ...[
                  CVFileLabel(
                    fileInfo: cvHistory.cv.pinnedFileInfo!,
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
        if (type == CVListType.freeCV || type == CVListType.myCVs)
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
                  child: (type == CVListType.myCVs)
                      ? ElevatedButton(
                          onPressed: () async {
                            final isUpdated =
                                await CVHistoryEventBottomSheet.show(
                              context,
                              enableGrade: profile?.isExpert == true &&
                                  cvHistory.cv.status != CVStatus.finished,
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
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.mint),
                          ),
                          child: Text(
                            S.of(context).comment.toUpperCase(),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            final isStarted =
                                await cvHistoryLoader.startReview();
                            if (isStarted) {
                              onReviewStarted(cvHistory.cv.id);
                            }
                          },
                          child: Text(
                            S.of(context).startReview.toUpperCase(),
                          ),
                        ),
                ),
                // Finish button
                if (profile?.isExpert == false &&
                    cvHistory.cv.status != CVStatus.finished) ...[
                  const SizedBox(width: 30),
                  _FinishButton(
                    onFinish: cvHistoryLoader.finishReview,
                    onFinished: onReviewFinished,
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _FinishButton extends StatelessWidget {
  const _FinishButton({
    required this.onFinish,
    required this.onFinished,
  });

  final Future<bool> Function() onFinish;
  final void Function() onFinished;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: min(
          MediaQuery.of(context).size.width * 0.4,
          500,
        ),
      ),
      child: ElevatedButton(
        onPressed: () async {
          final isFinished = await onFinish();
          if (isFinished) {
            onFinished();
          }
        },
        child: Text(
          S.of(context).finish.toUpperCase(),
        ),
      ),
    );
  }
}
