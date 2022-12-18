import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CVRatingLabel extends StatelessWidget {
  const CVRatingLabel({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toStringAsFixed(rating.truncateToDouble() == rating ? 0 : 1),
          style: const TextStyle(
            color: AppColors.mint,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Icon(
          Icons.star_rounded,
          color: AppColors.mint,
        ),
      ],
    );
  }
}
