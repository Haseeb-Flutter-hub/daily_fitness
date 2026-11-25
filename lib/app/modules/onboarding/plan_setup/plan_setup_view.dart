import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'plan_setup_controller.dart';

class PlanSetupView extends GetView<PlanSetupController> {
  const PlanSetupView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: AppAppBar(title: AppStrings.stepOf(3, 3)),
        body: Column(
          children: [
            const StepHeader(step: 3, total: 3),
            AppSpacing.h24,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.planTitle.toUpperCase(), style: AppTextStyles.h1),
                    const SectionHeader(AppStrings.fitnessLevel),
                    Obx(
                      () => AppSegmentedControl(
                        labels: PlanSetupController.levels,
                        selectedIndex: controller.levelIndex.value,
                        onChanged: (i) => controller.levelIndex.value = i,
                      ),
                    ),
                    const SectionHeader(AppStrings.daysPerWeek),
                    Obx(
                      () => AppChipGroup(
                        options: controller.dayLabels,
                        selectedIndex: controller.daysIndex.value,
                        onChanged: (i) => controller.daysIndex.value = i,
                      ),
                    ),
                    const SectionHeader(AppStrings.sessionLength),
                    Obx(
                      () => AppChipGroup(
                        options: controller.sessionLabels,
                        selectedIndex: controller.sessionIndex.value,
                        onChanged: (i) => controller.sessionIndex.value = i,
                      ),
                    ),
                    AppSpacing.h20,
                    Obx(
                      () => AppSwitchTile(
                        title: AppStrings.dailyReminder,
                        subtitle: controller.reminderLabel,
                        value: controller.reminderOn.value,
                        onChanged: (v) => controller.reminderOn.value = v,
                        onTap: controller.pickTime,
                      ),
                    ),
                    AppSpacing.h16,
                  ],
                ),
              ),
            ),
            AppButton(AppStrings.finishSetup, onPressed: controller.finish),
          ],
        ),
      );
}
