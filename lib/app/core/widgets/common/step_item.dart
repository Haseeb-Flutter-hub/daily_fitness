import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// "How to" ka numbered step.
class StepItem extends StatelessWidget {
  final int number;
  final String text;
  const StepItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: AppColors.primaryTint, shape: BoxShape.circle),
            child: Text('$number', style: AppTextStyles.label.copyWith(color: AppColors.primary)),
          ),
          AppSpacing.w12,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 14, height: 1.45)),
            ),
          ),
        ],
      );
}
