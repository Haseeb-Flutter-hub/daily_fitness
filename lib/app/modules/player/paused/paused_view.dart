import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/utils/formatters.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'paused_controller.dart';

class PausedView extends GetView<PausedController> {
  const PausedView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = controller.session;
    final total = s.exercises.length;
    return AppScaffold(
      appBar: AppAppBar(title: AppStrings.pausedBar, onBack: controller.resume),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProgressRing(
                    value: total == 0 ? 0 : s.completedCount.value / total,
                    size: 200,
                    strokeWidth: 10,
                    child: const Icon(Icons.pause_rounded, size: 64, color: AppColors.textMuted),
                  ),
                  AppSpacing.h24,
                  Text(
                    AppStrings.pausedTitle.toUpperCase(),
                    style: AppTextStyles.h1,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.h8,
                  Text(
                    '${Formatters.mmss(s.elapsed.value)} elapsed · '
                    '${AppStrings.exerciseOf(s.exerciseIndex.value + 1, total)}',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
          ),
          AppButton(AppStrings.resume, onPressed: controller.resume),
          AppSpacing.h12,
          AppButton(AppStrings.restartExercise, type: AppButtonType.ghost, onPressed: controller.restart),
          AppSpacing.h12,
          AppButton(AppStrings.endWorkout, type: AppButtonType.danger, onPressed: controller.endWorkout),
        ],
      ),
    );
  }
}
