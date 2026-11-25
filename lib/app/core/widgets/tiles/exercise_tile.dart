import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/cards/app_card.dart';
import 'package:daily_fitness/app/data/models/exercise.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback? onTap;

  const ExerciseTile(this.exercise, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: AppCard(
          onTap: onTap,
          padding: const EdgeInsets.all(12),
          borderRadius: AppRadius.lgAll,
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(color: AppColors.elevated, borderRadius: AppRadius.mdAll),
                child: const Icon(Icons.fitness_center_rounded, color: AppColors.primary),
              ),
              AppSpacing.w12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name, style: AppTextStyles.bodyBold),
                    Text('${exercise.muscles} · ${exercise.level}', style: AppTextStyles.caption),
                  ],
                ),
              ),
              Text(exercise.label, style: AppTextStyles.bodyBold),
            ],
          ),
        ),
      );
}
