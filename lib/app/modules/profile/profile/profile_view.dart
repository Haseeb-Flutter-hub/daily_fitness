import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: AppSpacing.screen,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(AppStrings.profileTitle.toUpperCase(), style: AppTextStyles.display(40))],
          ),
          AppSpacing.h16,
          Center(
            child: Column(
              children: [
                AppAvatar(name: controller.userName, size: 84, onTap: controller.openEditProfile),
                AppSpacing.h12,
                Text(controller.userName, style: AppTextStyles.h2),
                AppTag(controller.goalLabel),
              ],
            ),
          ),
          AppSpacing.h16,
          Row(
            children: [
              Expanded(child: AppStatCard(label: AppStrings.workouts, value: '${controller.totalWorkouts}')),
              AppSpacing.w12,
              Expanded(child: AppStatCard(label: AppStrings.hours, value: '${controller.totalHours}')),
              AppSpacing.w12,
              Expanded(
                child: AppStatCard(
                  label: AppStrings.bestStreak,
                  value: '${controller.bestStreak}',
                  valueColor: AppColors.danger,
                ),
              ),
            ],
          ),
          AppSpacing.h16,
          AppCard(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.dailyGoal, style: AppTextStyles.bodyBold),
                      Text('${controller.dailyGoalMinutes} min', style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.h16,
          AppCard(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                _row(Icons.person_outline_rounded, AppStrings.editProfile, controller.openEditProfile),
                _row(Icons.history_rounded, AppStrings.history, controller.openHistory),
                _row(Icons.emoji_events_outlined, AppStrings.achievementsTitle, controller.openAchievements),
                _row(Icons.settings_outlined, AppStrings.settings, controller.openSettings),
                _row(Icons.restart_alt_rounded, 'Reset demo data (test)', controller.resetDemoData),
                _row(Icons.logout_rounded, AppStrings.logOut, controller.logOut, danger: true, showChevron: false),
              ],
            ),
          ),
          AppSpacing.h16,
        ],
      );

  Widget _row(IconData icon, String label, VoidCallback onTap, {bool danger = false, bool showChevron = true}) =>
      ListTile(
        leading: Icon(icon, color: danger ? AppColors.danger : AppColors.textPrimary),
        title: Text(label, style: AppTextStyles.body.copyWith(color: danger ? AppColors.danger : AppColors.textPrimary)),
        trailing: showChevron ? const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted) : null,
        onTap: onTap,
      );
}
