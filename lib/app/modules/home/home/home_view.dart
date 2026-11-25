import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView(
          padding: AppSpacing.screen,
          children: [
            _header(),
            AppSpacing.h16,
            WeekStrip(
              days: controller.weekDays,
              today: controller.todayDate,
              completed: controller.completedDays,
            ),
            AppSpacing.h16,
            AppHeroCard(
              overline: AppStrings.todaysWorkout,
              title: 'Full Body Burn',
              meta: controller.workoutMeta,
              buttonLabel: controller.planDone ? AppStrings.completedLabel : AppStrings.startWorkout,
              onPressed: controller.startWorkout,
              trailing: ProgressRing(
                value: controller.workoutProgress,
                size: 84,
                strokeWidth: 10,
                color: AppColors.background,
                trackColor: AppColors.primaryDark,
                child: Text(
                  '${controller.exercisesDone}/${controller.exercisesTotal}',
                  style: AppTextStyles.display(26, color: AppColors.onPrimary),
                ),
              ),
            ),
            AppSpacing.h12,
            Row(
              children: [
                Expanded(
                  child: MiniRingStat(
                    value: '${controller.kcalBurned}',
                    label: AppStrings.kcalBurned,
                    progress: controller.kcalBurned / controller.kcalGoal,
                    color: AppColors.danger,
                  ),
                ),
                AppSpacing.w12,
                Expanded(
                  child: MiniRingStat(
                    value: '${controller.minutesDone}',
                    label: AppStrings.ofMinutes(controller.minutesGoal),
                    progress: controller.minutesDone / controller.minutesGoal,
                  ),
                ),
                AppSpacing.w12,
                Expanded(
                  child: MiniRingStat(
                    value: '${controller.streak}',
                    label: AppStrings.dayStreak,
                    progress: controller.streak == 0 ? 0 : 1,
                    color: AppColors.danger,
                    icon: Icons.local_fire_department_rounded,
                  ),
                ),
              ],
            ),
            const SectionHeader(AppStrings.programsForYou),
            SizedBox(
              height: 136,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.programs.length,
                separatorBuilder: (_, _) => AppSpacing.w12,
                itemBuilder: (_, i) {
                  final p = controller.programs[i];
                  return AppProgramCard(
                    name: p.name,
                    meta: p.meta,
                    level: p.level,
                    onTap: () => controller.openProgram(p),
                  );
                },
              ),
            ),
            AppSpacing.h16,
          ],
        ),
      );

  Widget _header() => Row(
        children: [
          AppAvatar(name: controller.userName.value, onTap: controller.openProfile),
          AppSpacing.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.greeting, style: AppTextStyles.caption),
                Text(controller.userName.value, style: AppTextStyles.title, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          AppIconButton(
            icon: Icons.calendar_today_outlined,
            tooltip: 'Calendar',
            onPressed: controller.openCalendar,
          ),
          AppSpacing.w8,
          AppIconButton(
            icon: Icons.notifications_none_rounded,
            tooltip: 'Notifications',
            onPressed: controller.openNotifications,
          ),
        ],
      );
}
