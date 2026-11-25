import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/cards/app_card.dart';
import 'package:daily_fitness/app/core/widgets/progress/progress_ring.dart';

/// Chhota ring + neeche label (Home ke 3 stats).
class MiniRingStat extends StatelessWidget {
  final String value;
  final String label;
  final double progress;
  final Color color;
  final IconData? icon; // diya to value ki jagah icon dikhega

  const MiniRingStat({
    super.key,
    required this.value,
    required this.label,
    required this.progress,
    this.color = AppColors.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => AppCard(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProgressRing(
              value: progress,
              size: 64,
              strokeWidth: 7,
              color: color,
              child: icon != null
                  ? Icon(icon, size: 24, color: color)
                  : Text(value, style: AppTextStyles.bodyBold),
            ),
            AppSpacing.h8,
            Text(label, textAlign: TextAlign.center, style: AppTextStyles.small),
          ],
        ),
      );
}
