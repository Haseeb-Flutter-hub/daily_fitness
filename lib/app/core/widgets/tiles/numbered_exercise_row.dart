import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/cards/app_card.dart';

class NumberedExerciseRow extends StatelessWidget {
  final int number;
  final String name;
  final String label;

  const NumberedExerciseRow({super.key, required this.number, required this.name, required this.label});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          borderRadius: AppRadius.mdAll,
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: AppColors.elevated, shape: BoxShape.circle),
                child: Text('$number', style: AppTextStyles.label.copyWith(color: AppColors.primary)),
              ),
              AppSpacing.w12,
              Expanded(child: Text(name, style: AppTextStyles.bodyBold)),
              Text(label, style: AppTextStyles.caption),
            ],
          ),
        ),
      );
}
