import 'package:cviewer_frontend/domain/logic/cv/cv_history_event_creator.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/widgets/grade/grade_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CVHistoryEventBottomSheet extends StatefulWidget {
  const CVHistoryEventBottomSheet({
    super.key,
    required this.enableGrade,
    required this.enableFileAttachment,
    required this.eventCreator,
  });

  final bool enableGrade;
  final bool enableFileAttachment;
  final CVHistoryEventCreator eventCreator;

  static Future<bool?> show(
    BuildContext context, {
    required bool enableGrade,
    required bool enableFileAttachment,
    required CVHistoryEventCreator eventCreator,
  }) {
    return showModalBottomSheet<bool?>(
      context: context,
      isScrollControlled: true,
      builder: (_) => CVHistoryEventBottomSheet(
        enableGrade: enableGrade,
        enableFileAttachment: enableFileAttachment,
        eventCreator: eventCreator,
      ),
    );
  }

  @override
  State<CVHistoryEventBottomSheet> createState() =>
      _CVHistoryEventBottomSheetState();
}

class _CVHistoryEventBottomSheetState extends State<CVHistoryEventBottomSheet> {
  final _commentController = TextEditingController();
  int? _grade;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _onAttach() {
    widget.eventCreator.selectFile();
  }

  void _onSend(BuildContext context) async {
    final comment = _commentController.text;
    final isSent = await widget.eventCreator.createEvent(
      comment: comment.isNotEmpty ? comment : null,
      grade: _grade,
    );
    if (isSent) {
      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        color: AppColors.emerald,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grade
            if (widget.enableGrade)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GradeForm(
                  showCheckbox: true,
                  onGradeChanged: (grade) => _grade = grade,
                ),
              ),
            // File chip
            if (widget.enableFileAttachment)
              Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 10),
                child: _FileChip(widget.eventCreator),
              ),
            // File + comment
            Row(
              children: [
                // File attachment
                if (widget.enableFileAttachment) ...[
                  GestureDetector(
                    onTap: _onAttach,
                    child: const Icon(
                      Icons.attach_file_rounded,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                // Comment input field
                Expanded(
                  child: TextFormField(
                    maxLines: 5,
                    controller: _commentController,
                    cursorColor: AppColors.white,
                    style: const TextStyle(
                      color: AppColors.black,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: AppColors.grey),
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Send icon
                GestureDetector(
                  onTap: () => _onSend(context),
                  child: const Icon(
                    Icons.send_outlined,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FileChip extends StatelessWidget {
  const _FileChip(this._eventCreator);

  final CVHistoryEventCreator _eventCreator;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final fn = _eventCreator.fileName;

        return Opacity(
          opacity: (fn != null) ? 1 : 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(fn ?? ''),
                const SizedBox(width: 10),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _eventCreator.removeFile(),
                  child: const Icon(
                    Icons.cancel,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
