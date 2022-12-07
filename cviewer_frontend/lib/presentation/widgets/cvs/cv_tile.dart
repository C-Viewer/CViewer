import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_status_label.dart';
import 'package:cviewer_frontend/presentation/widgets/tags/tag_list.dart';
import 'package:cviewer_frontend/utils/date_time_formatters.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CVTile extends StatelessWidget {
  const CVTile({
    super.key,
    required this.cv,
  });

  final CV cv;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(
        RouteNames.resume,
        params: {
          RouteParams.resumeId: cv.id.toString(),
        },
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tags
              if (cv.tags.isNotEmpty) ...[
                TagList(items: cv.tags),
                const SizedBox(height: 10),
              ],
              // Title
              Text(
                cv.title,
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
                    DateTimeFormatters.formatDayMonthYear(cv.creationDate),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  // Status
                  CVStatusLabel(
                    status: cv.status,
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
