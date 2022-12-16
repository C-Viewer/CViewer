import 'package:cviewer_frontend/constants/route_constants.dart';
import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:cviewer_frontend/presentation/widgets/cv_tags/cv_tag_group.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_rating_label.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_status_label.dart';
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
      onTap: () => context.pushNamed(
        RouteNames.cvHistory,
        params: {
          RouteParams.cvId: cv.id.toString(),
        },
      ),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Text(
                    cv.title,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 20,
                    ),
                  ),
                  // Rating
                  if (cv.rating != null)
                    CVRatingLabel(
                      rating: cv.rating ?? 0,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // Tags
              if (cv.tags.isNotEmpty) ...[
                CVTagGroup(tags: cv.tags),
                const SizedBox(height: 12),
              ],
              // Main info
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Creation date
                  Text(
                    DateTimeFormatters.formatDayMonthYear(cv.creationDate),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                  // Status
                  Center(
                    child: CVStatusLabel(
                      status: cv.status,
                    ),
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
