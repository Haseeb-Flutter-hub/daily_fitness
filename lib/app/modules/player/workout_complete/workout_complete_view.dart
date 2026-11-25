import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/formatters.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'workout_complete_controller.dart';

class WorkoutCompleteView extends GetView<WorkoutCompleteController> {
  const WorkoutCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = controller.session;
    return AppScaffold(
      appBar: AppAppBar(title: AppStrings.summary, onBack: controller.done),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSpacing.h8,
                  const ProgressRing(
                    value: 1,
                    size: 150,
                    strokeWidth: 12,
                    child: Icon(Icons.check_rounded, size: 56, color: AppColors.primary),
                  ),
                  AppSpacing.h20,
                  Text(
                    AppStrings.workoutComplete.toUpperCase(),
                    style: AppTextStyles.h1,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.h8,
                  Text(AppStrings.greatJob(controller.userName), style: AppTextStyles.caption),
                  AppSpacing.h24,
                  Row(
                    children: [
                      Expanded(
                        child: AppStatCard(label: AppStrings.timeLabel, value: Formatters.mmss(s.elapsed.value)),
                      ),
                      AppSpacing.w12,
                      Expanded(
                        child: AppStatCard(label: AppStrings.caloriesLabel, value: '${s.kcalBurned.value} kcal'),
                      ),
                    ],
                  ),
                  AppSpacing.h12,
                  Row(
                    children: [
                      Expanded(
                        child: AppStatCard(
                          label: AppStrings.exercisesLabel,
                          value: '${s.completedCount.value} / ${s.exercises.length}',
                        ),
                      ),
                      AppSpacing.w12,
                      Expanded(
                        child: AppStatCard(
                          label: AppStrings.streakLabel,
                          value: '${controller.streak} days',
                          valueColor: AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                  const SectionHeader(AppStrings.howDidItFeel),
                  Obx(
                    () => AppChipGroup(
                      options: const ['Easy', 'Good', 'Hard'],
                      selectedIndex: controller.feel.value,
                      onChanged: (i) => controller.feel.value = i,
                    ),
                  ),
                  AppSpacing.h16,
                ],
              ),
            ),
          ),
          AppSpacing.h12,
          AppButton(AppStrings.done, onPressed: controller.done),
          AppTextLink(
            AppStrings.viewProgress,
            expanded: true,
            onTap: controller.viewProgress,
          ),
        ],
      ),
    );
  }
}
