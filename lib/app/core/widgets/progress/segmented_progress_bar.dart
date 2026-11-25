import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';

class SegmentedProgressBar extends StatelessWidget {
  final int total;
  final int filled;
  final double height;
  final double gap;
  final Color activeColor;

  const SegmentedProgressBar({
    super.key,
    required this.total,
    required this.filled,
    this.height = 5,
    this.gap = 6,
    this.activeColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          for (var i = 0; i < total; i++)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: i == 0 ? 0 : gap),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: height,
                  decoration: BoxDecoration(
                    color: i < filled ? activeColor : AppColors.elevated,
                    borderRadius: AppRadius.pill,
                  ),
                ),
              ),
            ),
        ],
      );
}
