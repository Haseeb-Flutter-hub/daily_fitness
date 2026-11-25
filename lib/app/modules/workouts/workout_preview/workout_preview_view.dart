import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'workout_preview_controller.dart';

class WorkoutPreviewView extends GetView<WorkoutPreviewController> {
  const WorkoutPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = controller.session;
    return AppScaffold(
      appBar: const AppAppBar(title: AppStrings.todaysWorkoutTitle),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.title.value.toUpperCase(), style: AppTextStyles.h1),
                  AppSpacing.h12,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      AppChip(label: '${s.totalMinutes} min'),
                      AppChip(label: '${s.exercises.length} exercises'),
                      const AppChip(label: AppStrings.noEquipment),
                    ],
                  ),
                  AppSpacing.h16,
                  for (var i = 0; i < s.exercises.length; i++)
                    NumberedExerciseRow(
                      number: i + 1,
                      name: s.exercises[i].name,
                      label: s.exercises[i].label,
                    ),
                ],
              ),
            ),
          ),
          AppSpacing.h12,
          AppButton(AppStrings.start, onPressed: controller.start),
        ],
      ),
    );
  }
}
