import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/models/resume/resume.dart';
import 'package:cviewer_frontend/presentation/widgets/resume/resume_status_label.dart';
import 'package:cviewer_frontend/presentation/widgets/tags/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResumeTile extends StatelessWidget {
  const ResumeTile({
    super.key,
    required this.item,
  });

  final Resume item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(
        RouteNames.resume,
        params: {
          RouteParams.resumeId: item.id.toString(),
        },
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tags
              if (item.tags.isNotEmpty) ...[
                TagList(items: item.tags),
                const SizedBox(height: 10),
              ],
              // Title
              Text(
                item.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Last activity date
                  Text(
                    'dd.MM.YYYY',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  // Status
                  ResumeStatusLabel(
                    status: item.status,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
