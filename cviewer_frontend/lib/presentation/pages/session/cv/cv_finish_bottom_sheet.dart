import 'dart:math';

import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/logic/cv/cv_finish_reporter.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/widgets/grade/grade_form.dart';
import 'package:flutter/material.dart';

class CVFinishBottomSheet extends StatefulWidget {
  const CVFinishBottomSheet({
    super.key,
    required this.reporter,
    required this.showAgreement,
  });

  final CVFinishReporter reporter;
  final bool showAgreement;

  static Future<bool?> show(
    BuildContext context, {
    required CVFinishReporter reporter,
    required bool showAgreement,
  }) {
    return showModalBottomSheet<bool?>(
      context: context,
      isScrollControlled: true,
      builder: (_) => CVFinishBottomSheet(
        reporter: reporter,
        showAgreement: showAgreement,
      ),
    );
  }

  @override
  State<CVFinishBottomSheet> createState() => _CVFinishBottomSheetState();
}

class _CVFinishBottomSheetState extends State<CVFinishBottomSheet> {
  final _commentController = TextEditingController();
  int _grade = 5;
  var _markCVAsBest = false;

  @override
  void initState() {
    super.initState();
    if (widget.showAgreement) {
      _markCVAsBest = true;
    }
  }

  void _onSend(BuildContext context) async {
    final comment = _commentController.text;
    final isProcessed = await widget.reporter.sendReport(
      grade: _grade,
      comment: comment.isNotEmpty ? comment : null,
      markCVAsBest: _markCVAsBest,
    );
    if (isProcessed) {
      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.emerald,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              S.of(context).rateMessage,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
            ),
          ),
          // Grade
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: GradeForm(
              showCheckbox: false,
              mainAxisAlignment: MainAxisAlignment.center,
              onGradeChanged: (grade) => _grade = grade!,
            ),
          ),
          // Comment input field
          Row(
            children: [
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
            ],
          ),
          const SizedBox(height: 20),
          // Mark as best (agreement)
          if (widget.showAgreement)
            Row(
              children: [
                Checkbox(
                  checkColor: AppColors.emerald,
                  activeColor: AppColors.white,
                  value: _markCVAsBest,
                  onChanged: (_) => setState(
                    () => _markCVAsBest = !_markCVAsBest,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    S.of(context).markAsBestCVAgreement,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 40),
          // Send button
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: min(
                MediaQuery.of(context).size.width * 0.4,
                500,
              ),
            ),
            child: ElevatedButton(
              onPressed: () => _onSend(context),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.mint),
              ),
              child: Text(
                S.of(context).rate.toUpperCase(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
