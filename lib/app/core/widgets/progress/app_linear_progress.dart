import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';

class AppLinearProgress extends StatelessWidget {
  final double value; // 0..1
  final double height;
  final Color color;
  final Color trackColor;

  const AppLinearProgress({
    super.key,
    required this.value,
    this.height = 5,
    this.color = AppColors.primary,
    this.trackColor = AppColors.elevated,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: AppRadius.pill,
        child: LinearProgressIndicator(
          value: value.clamp(0.0, 1.0).toDouble(),
          minHeight: height,
          backgroundColor: trackColor,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      );
}
