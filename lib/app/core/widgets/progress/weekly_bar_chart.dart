import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Hafte ka bar chart: 7 values (Mon..Sun), aaj ka bar highlight.
class WeeklyBarChart extends StatelessWidget {
  final List<int> values;
  final int todayIndex; // 0 = Mon .. 6 = Sun
  final double height;

  const WeeklyBarChart({
    super.key,
    required this.values,
    required this.todayIndex,
    this.height = 90,
  });

  static const _labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final maxVal = values.fold<int>(1, (m, v) => v > m ? v : m);
    return SizedBox(
      height: height + 44, // number (16) + gap (4) + bar (height) + gap (6) + label (14) + thoda margin
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < values.length; i++)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${values[i]}',
                    style: AppTextStyles.small.copyWith(fontSize: 10),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: values[i] == 0 ? 4 : (values[i] / maxVal) * height,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: i == todayIndex ? AppColors.primary : AppColors.elevated,
                      borderRadius: AppRadius.smAll,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _labels[i],
                    style: AppTextStyles.small.copyWith(fontSize: 10),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
