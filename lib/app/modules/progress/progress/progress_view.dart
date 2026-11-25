import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'progress_controller.dart';

class ProgressView extends GetView<ProgressController> {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() {
        final pct = controller.vsLastWeekPercent;
        return ListView(
          padding: AppSpacing.screen,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(AppStrings.progressTitle.toUpperCase(), style: AppTextStyles.display(40)),
                ),
                AppIconButton(
                  icon: Icons.history_rounded,
                  tooltip: AppStrings.history,
                  onPressed: controller.openHistory,
                ),
              ],
            ),
            AppSpacing.h16,
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.activeMinutes, style: AppTextStyles.caption),
                            AppSpacing.h4,
                            Text('${controller.weekTotal} min', style: AppTextStyles.display(34)),
                          ],
                        ),
                      ),
                      AppTag(
                        '${pct >= 0 ? '+' : ''}$pct% ${AppStrings.vsLastWeek}',
                        filled: pct >= 0,
                      ),
                    ],
                  ),
                  AppSpacing.h16,
                  WeeklyBarChart(values: controller.weekMinutes, todayIndex: controller.todayIndex),
                ],
              ),
            ),
            AppSpacing.h16,
            AppCard(
              onTap: controller.openLogWeight,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.bodyWeight, style: AppTextStyles.caption),
                        Text('Log weight', style: AppTextStyles.bodyBold),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                ],
              ),
            ),
            SectionHeader(AppStrings.achievementsTitle, actionLabel: AppStrings.seeAll, onAction: controller.openAchievements),
            Row(
              children: [
                Expanded(
                  child: AchievementBadge(
                    icon: Icons.local_fire_department_rounded,
                    title: AppStrings.badge7Day,
                    subtitle: controller.badge7Day ? '' : 'Locked',
                    unlocked: controller.badge7Day,
                    color: AppColors.danger,
                  ),
                ),
                Expanded(
                  child: AchievementBadge(
                    icon: Icons.fitness_center_rounded,
                    title: AppStrings.badge10Workouts,
                    subtitle: controller.badge10Workouts ? '' : 'Locked',
                    unlocked: controller.badge10Workouts,
                  ),
                ),
                Expanded(
                  child: AchievementBadge(
                    icon: Icons.bolt_rounded,
                    title: AppStrings.badgeEarlyBird,
                    subtitle: controller.badgeEarlyBird ? '' : 'Locked',
                    unlocked: controller.badgeEarlyBird,
                  ),
                ),
              ],
            ),
            AppSpacing.h16,
          ],
        );
      });
}
