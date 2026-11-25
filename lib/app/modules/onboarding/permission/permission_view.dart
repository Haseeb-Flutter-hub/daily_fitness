import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'permission_controller.dart';

class PermissionView extends GetView<PermissionController> {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const IconBadge(icon: Icons.notifications_none_rounded, size: 120, iconSize: 52),
                      AppSpacing.h24,
                      Text(
                        AppStrings.permissionTitle.toUpperCase(),
                        style: AppTextStyles.h1,
                        textAlign: TextAlign.center,
                      ),
                      AppSpacing.h12,
                      Text(
                        AppStrings.permissionSub,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(color: AppColors.textMuted, height: 1.5),
                      ),
                      AppSpacing.h24,
                      const AppCard(
                        child: Column(
                          children: [
                            BenefitRow(icon: Icons.local_fire_department_rounded, text: AppStrings.benefitStreak),
                            AppSpacing.h16,
                            BenefitRow(icon: Icons.access_time_rounded, text: AppStrings.benefitTime),
                            AppSpacing.h16,
                            BenefitRow(icon: Icons.star_outline_rounded, text: AppStrings.benefitBadges),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppButton(AppStrings.turnOnReminders, onPressed: controller.turnOn),
            AppSpacing.h8,
            AppTextLink(
              AppStrings.notNow,
              expanded: true,
              color: AppColors.textPrimary,
              onTap: controller.notNow,
            ),
          ],
        ),
      );
}
