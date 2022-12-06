import 'package:cviewer_frontend/domain/models/cv/cv.dart';
import 'package:cviewer_frontend/presentation/widgets/cvs/cv_tile.dart';
import 'package:flutter/material.dart';

class CVList extends StatelessWidget {
  const CVList({
    super.key,
    required this.cvs,
  });

  final List<CV> cvs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cvs.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      itemBuilder: (_, i) => CVTile(cv: cvs[i]),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
