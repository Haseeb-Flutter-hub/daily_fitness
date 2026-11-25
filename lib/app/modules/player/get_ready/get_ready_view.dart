import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';
import 'get_ready_controller.dart';

class GetReadyView extends GetView<GetReadyController> {
  const GetReadyView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() {
        final s = controller.session;
        final first = s.exercises.first;
        final detail = first.seconds != null ? '${first.seconds} sec' : '${first.reps} reps';
        return AppScaffold(
          appBar: const AppAppBar(),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProgressRing(
                        value: s.remaining.value / WorkoutSessionController.readySeconds,
                        size: 250,
                        strokeWidth: 12,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${s.remaining.value}', style: AppTextStyles.display(120)),
                            Text(AppStrings.getReady, style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      AppSpacing.h24,
                      Text(AppStrings.firstUp, style: AppTextStyles.caption),
                      AppSpacing.h8,
                      Text(first.name.toUpperCase(), style: AppTextStyles.h2),
                      AppSpacing.h8,
                      Text('${first.sets} sets · $detail', style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ),
              AppButton(AppStrings.startNow, onPressed: controller.startNow),
              AppSpacing.h12,
              AppButton(AppStrings.cancel, type: AppButtonType.ghost, onPressed: controller.cancel),
            ],
          ),
        );
      });
}
