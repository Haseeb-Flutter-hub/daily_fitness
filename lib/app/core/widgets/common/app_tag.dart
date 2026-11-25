import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Chhota label: "INTERMEDIATE", "NEW", "BEST VALUE".
class AppTag extends StatelessWidget {
  final String label;
  final bool filled;
  const AppTag(this.label, {super.key, this.filled = false});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : AppColors.primaryTint,
          borderRadius: AppRadius.pill,
        ),
        child: Text(
          label.toUpperCase(),
          style: AppTextStyles.small.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: filled ? AppColors.onPrimary : AppColors.primary,
          ),
        ),
      );
}
