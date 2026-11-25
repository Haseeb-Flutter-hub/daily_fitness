import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'goals_controller.dart';

class GoalsView extends GetView<GoalsController> {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: AppAppBar(title: AppStrings.stepOf(2, 3)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StepHeader(step: 2, total: 3),
            AppSpacing.h24,
            Text(AppStrings.goalsTitle.toUpperCase(), style: AppTextStyles.h1),
            AppSpacing.h8,
            Text(AppStrings.goalsSub, style: AppTextStyles.caption.copyWith(fontSize: 15)),
            AppSpacing.h24,
            Expanded(
              child: Obx(
                () => GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.25,
                  children: [
                    for (var i = 0; i < GoalsController.goals.length; i++)
                      AppGoalCard(
                        icon: GoalsController.goals[i].icon,
                        title: GoalsController.goals[i].label,
                        selected: controller.selected.value == i,
                        onTap: () => controller.select(i),
                      ),
                  ],
                ),
              ),
            ),
            AppButton(AppStrings.continueLabel, onPressed: controller.next),
          ],
        ),
      );
}
