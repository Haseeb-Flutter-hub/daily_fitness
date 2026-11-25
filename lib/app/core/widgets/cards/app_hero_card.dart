import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Bara lime card: "Today's workout".
class AppHeroCard extends StatelessWidget {
  final String overline;
  final String title;
  final String meta;
  final String buttonLabel;
  final VoidCallback onPressed;
  final Widget? trailing;

  const AppHeroCard({
    super.key,
    required this.overline,
    required this.title,
    required this.meta,
    required this.buttonLabel,
    required this.onPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(color: AppColors.primary, borderRadius: AppRadius.xlAll),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overline,
                    style: AppTextStyles.label.copyWith(color: AppColors.onPrimary, letterSpacing: 1, fontSize: 12),
                  ),
                  AppSpacing.h8,
                  Text(title.toUpperCase(), style: AppTextStyles.display(38, color: AppColors.onPrimary)),
                  AppSpacing.h8,
                  Text(meta, style: AppTextStyles.body.copyWith(fontSize: 13, color: AppColors.onPrimary)),
                  AppSpacing.h16,
                  FilledButton(
                    onPressed: onPressed,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.primary,
                      minimumSize: const Size(0, 44),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(buttonLabel),
                  ),
                ],
              ),
            ),
            if (trailing != null) ...[AppSpacing.w12, trailing!],
          ],
        ),
      );
}
