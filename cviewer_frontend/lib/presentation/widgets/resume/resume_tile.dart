import 'package:cviewer_frontend/presentation/route_paths.dart';
import 'package:cviewer_frontend/presentation/widgets/tags/tag_list.dart';
import 'package:flutter/material.dart';

class ResumeTile extends StatelessWidget {
  const ResumeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(RoutePaths.applicantReview),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TagList(),
              const SizedBox(height: 10),
              Text(
                'Android developer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '04.11.2022',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
