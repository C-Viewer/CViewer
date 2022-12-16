import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/widgets/grade/grade_form.dart';
import 'package:flutter/material.dart';

class CVHistoryEventBottomSheet extends StatelessWidget {
  const CVHistoryEventBottomSheet({
    super.key,
    required this.enableGrade,
    required this.enableFileAttachment,
  });

  final bool enableGrade;
  final bool enableFileAttachment;

  static void show(
    BuildContext context, {
    required bool enableGrade,
    required bool enableFileAttachment,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CVHistoryEventBottomSheet(
        enableGrade: enableGrade,
        enableFileAttachment: enableFileAttachment,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.emerald,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Grade
          if (enableGrade)
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: GradeForm(
                showCheckbox: true,
              ),
            ),
          // File + comment
          Row(
            children: [
              // File attachment
              if (enableFileAttachment) ...[
                const Icon(
                  Icons.attach_file_rounded,
                  color: AppColors.lightGrey,
                ),
                const SizedBox(width: 10),
              ],
              // Comment input field
              Expanded(
                child: TextFormField(
                  maxLines: 5,
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
              const Icon(
                Icons.send_outlined,
                color: AppColors.lightGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
