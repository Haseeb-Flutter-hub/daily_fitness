import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bolt_rounded, color: AppColors.primary, size: 20),
                AppSpacing.w8,
                Text(
                  AppStrings.appName.toUpperCase(),
                  style: AppTextStyles.label.copyWith(letterSpacing: 1),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 290,
                  height: 290,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const RingsGraphic(size: 290, colored: true),
                      const Positioned(
                        left: -14,
                        top: 40,
                        child: AppChip(label: AppStrings.chip20Min, backgroundColor: AppColors.card),
                      ),
                      const Positioned(
                        right: -14,
                        top: 130,
                        child: AppChip(label: AppStrings.chipNoEquipment, backgroundColor: AppColors.card),
                      ),
                      const Positioned(
                        left: 10,
                        bottom: 36,
                        child: AppChip(label: AppStrings.chipZeroGym, selected: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(AppStrings.welcomeLine1.toUpperCase(), style: AppTextStyles.display(54)),
            Text(
              AppStrings.welcomeLine2.toUpperCase(),
              style: AppTextStyles.display(54, color: AppColors.primary),
            ),
            AppSpacing.h16,
            Text(
              AppStrings.welcomeBody,
              style: AppTextStyles.body.copyWith(color: AppColors.textMuted, height: 1.5),
            ),
            AppSpacing.h24,
            AppButton(AppStrings.getStarted, onPressed: controller.onGetStarted),
            AppTextLink(
              AppStrings.haveAccount,
              expanded: true,
              color: AppColors.textPrimary,
              onTap: controller.onHaveAccount,
            ),
          ],
        ),
      );
}
