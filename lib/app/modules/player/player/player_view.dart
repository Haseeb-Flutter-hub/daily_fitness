import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/modules/player/rest/rest_view.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() {
        final s = controller.session;
        final resting = s.phase.value == SessionPhase.rest;
        return AppScaffold(
          body: Column(
            children: [
              Row(
                children: [
                  AppIconButton(
                    icon: Icons.close_rounded,
                    tooltip: 'Pause',
                    onPressed: controller.openPause,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        AppStrings.exerciseOf(s.exerciseIndex.value + 1, s.exercises.length),
                        style: AppTextStyles.bodyBold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 42),
                ],
              ),
              AppSpacing.h12,
              SegmentedProgressBar(total: s.exercises.length, filled: s.completedCount.value),
              Expanded(child: resting ? const RestBody() : _work(s)),
            ],
          ),
        );
      });

  Widget _work(WorkoutSessionController s) {
    final e = s.current;
    final timed = e.seconds != null;
    final ringValue = timed ? s.remaining.value / e.seconds! : (s.setNumber.value - 1) / e.sets;
    final next = s.next;

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProgressRing(
                value: ringValue,
                size: 240,
                strokeWidth: 12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(timed ? '${s.remaining.value}' : '${e.reps}', style: AppTextStyles.display(104)),
                    Text(timed ? AppStrings.secondsLabel : AppStrings.repsLabel, style: AppTextStyles.caption),
                  ],
                ),
              ),
              AppSpacing.h16,
              Text(e.name.toUpperCase(), style: AppTextStyles.h1),
              AppSpacing.h8,
              Text(AppStrings.setOf(s.setNumber.value, e.sets), style: AppTextStyles.caption),
              if (e.steps.isNotEmpty) ...[
                AppSpacing.h12,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(e.steps.first, textAlign: TextAlign.center, style: AppTextStyles.caption),
                ),
              ],
            ],
          ),
        ),
        if (!timed) ...[
          AppButton(AppStrings.setDone, onPressed: s.completeSet),
          AppSpacing.h12,
        ],
        if (next != null)
          AppCard(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.upNext, style: AppTextStyles.small),
                      Text(next.name, style: AppTextStyles.bodyBold),
                    ],
                  ),
                ),
                Text(next.label, style: AppTextStyles.caption),
              ],
            ),
          ),
        AppSpacing.h16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconButton(icon: Icons.skip_previous_rounded, tooltip: 'Previous', onPressed: s.previous),
            const SizedBox(width: 22),
            AppPlayButton(icon: Icons.pause_rounded, onPressed: controller.openPause),
            const SizedBox(width: 22),
            AppIconButton(icon: Icons.skip_next_rounded, tooltip: 'Skip', onPressed: s.skipExercise),
          ],
        ),
        AppSpacing.h8,
      ],
    );
  }
}
