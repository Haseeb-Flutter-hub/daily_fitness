import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_radius.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'exercise_detail_controller.dart';

class ExerciseDetailView extends GetView<ExerciseDetailController> {
  const ExerciseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final e = controller.exercise;
    return AppScaffold(
      appBar: const AppAppBar(title: AppStrings.exerciseTitle),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _hero(),
                  AppSpacing.h20,
                  Text(e.name.toUpperCase(), style: AppTextStyles.h1),
                  AppSpacing.h12,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      AppChip(label: e.category),
                      AppChip(label: e.level),
                      AppChip(label: e.label),
                      AppChip(label: '~${e.minutes} min'),
                    ],
                  ),
                  const SectionHeader(AppStrings.targetMuscles),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [for (final m in controller.muscles) AppChip(label: m, selected: true)],
                  ),
                  const SectionHeader(AppStrings.howTo),
                  for (var i = 0; i < e.steps.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: StepItem(number: i + 1, text: e.steps[i]),
                    ),
                  AppSpacing.h8,
                ],
              ),
            ),
          ),
          AppSpacing.h12,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  AppStrings.addToWorkout,
                  type: AppButtonType.ghost,
                  onPressed: controller.addToWorkout,
                ),
              ),
              AppSpacing.w12,
              Expanded(child: AppButton(AppStrings.start, onPressed: controller.start)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hero() => Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.elevated, borderRadius: AppRadius.xlAll),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const RingsGraphic(size: 200),
            const Icon(Icons.accessibility_new_rounded, size: 72, color: AppColors.primary),
            Positioned(
              right: 14,
              bottom: 14,
              child: Material(
                color: AppColors.background,
                shape: const StadiumBorder(),
                child: InkWell(
                  customBorder: const StadiumBorder(),
                  onTap: controller.watchDemo,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Text(AppStrings.watchDemo, style: AppTextStyles.label),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
