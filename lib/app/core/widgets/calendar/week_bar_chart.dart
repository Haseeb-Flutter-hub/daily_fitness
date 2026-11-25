import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/cards/app_card.dart';

class WeekBarChart extends StatelessWidget {
  final List<int> minutes; // Mon..Sun
  final int maxMinutes;

  const WeekBarChart({
    super.key,
    required this.minutes,
    this.maxMinutes = 60,
  });

  static const _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    final highest = minutes.isEmpty ? maxMinutes : minutes.reduce((a, b) => a > b ? a : b);
    final limit = highest > maxMinutes ? highest : maxMinutes;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('MINUTES PER DAY', style: AppTextStyles.label.copyWith(color: AppColors.textMuted)),
              Text(
                '${minutes.fold<int>(0, (a, b) => a + b)} min total',
                style: AppTextStyles.caption.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          AppSpacing.h16,
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (i) {
                final min = i < minutes.length ? minutes[i] : 0;
                final heightFactor = limit == 0 ? 0.0 : (min / limit).clamp(0.05, 1.0);
                final hasWorkout = min > 0;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (hasWorkout)
                      Text('$min', style: AppTextStyles.small.copyWith(fontSize: 10, color: AppColors.textMuted))
                    else
                      const SizedBox(height: 14),
                    AppSpacing.h4,
                    Container(
                      width: 22,
                      height: 80 * heightFactor,
                      decoration: BoxDecoration(
                        color: hasWorkout ? AppColors.primary : AppColors.elevated,
                        borderRadius: AppRadius.smAll,
                      ),
                    ),
                    AppSpacing.h8,
                    Text(
                      _days[i],
                      style: AppTextStyles.caption.copyWith(
                        color: hasWorkout ? AppColors.textPrimary : AppColors.textMuted,
                        fontWeight: hasWorkout ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
