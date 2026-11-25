import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Gol icon + title (Achievements grid ka ek card).
class AchievementBadge extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool unlocked;
  final Color color;

  const AchievementBadge({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.unlocked,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: unlocked ? 1 : 0.45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: AppColors.elevated, shape: BoxShape.circle),
              child: Icon(icon, size: 26, color: color),
            ),
            AppSpacing.h8,
            Text(title, textAlign: TextAlign.center, style: AppTextStyles.label.copyWith(fontSize: 13)),
            Text(subtitle, textAlign: TextAlign.center, style: AppTextStyles.small),
          ],
        ),
      );
}
