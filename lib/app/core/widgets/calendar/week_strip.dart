import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Hafte ki patti: 7 din, aaj lime, mukammal dinon par dot.
class WeekStrip extends StatelessWidget {
  final List<DateTime> days; // 7 din (Mon..Sun)
  final DateTime today;
  final Set<DateTime> completed;

  const WeekStrip({super.key, required this.days, required this.today, this.completed = const {}});

  static const _labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  bool _same(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

  Widget _cell(DateTime d) {
    final isToday = _same(d, today);
    final done = completed.any((c) => _same(c, d));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isToday ? AppColors.primary : Colors.transparent,
          borderRadius: AppRadius.mdAll,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _labels[d.weekday - 1],
              style: AppTextStyles.small.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isToday ? AppColors.onPrimary : AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${d.day}',
              style: AppTextStyles.bodyBold.copyWith(
                fontSize: 16,
                color: isToday ? AppColors.onPrimary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: done ? (isToday ? AppColors.onPrimary : AppColors.primary) : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [for (final d in days) Expanded(child: _cell(d))],
      );
}
