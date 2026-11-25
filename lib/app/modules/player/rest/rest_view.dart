import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/modules/player/workout_session_controller.dart';

/// Rest ka hissa: coral ring, +10 sec, Skip rest.
class RestBody extends StatelessWidget {
  const RestBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Get.find<WorkoutSessionController>();
    return Obx(() {
      final nextLabel = s.restLeadsToNext
          ? 'Next: ${s.next?.name ?? ''}'
          : 'Next: ${AppStrings.setOf(s.setNumber.value + 1, s.current.sets)}';
      return Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressRing(
                  value: s.remaining.value / s.restTotal.value,
                  size: 240,
                  strokeWidth: 12,
                  color: AppColors.danger,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${s.remaining.value}',
                        style: AppTextStyles.display(104, color: AppColors.danger),
                      ),
                      Text(AppStrings.secondsLabel, style: AppTextStyles.caption),
                    ],
                  ),
                ),
                AppSpacing.h16,
                Text(AppStrings.restTitle.toUpperCase(), style: AppTextStyles.h1),
                AppSpacing.h8,
                Text(nextLabel, style: AppTextStyles.caption),
                AppSpacing.h12,
                SizedBox(
                  width: 140,
                  child: AppButton(
                    AppStrings.addTenSeconds,
                    type: AppButtonType.ghost,
                    height: 42,
                    onPressed: () => s.addRest(10),
                  ),
                ),
              ],
            ),
          ),
          AppButton(AppStrings.skipRest, onPressed: s.skipRest),
          AppTextLink(
            AppStrings.finishWorkout,
            expanded: true,
            color: AppColors.textMuted,
            onTap: s.finish,
          ),
        ],
      );
    });
  }
}
