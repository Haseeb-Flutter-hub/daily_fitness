import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const RingsGraphic(size: 390),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppLogo(size: 140),
                      AppSpacing.h20,
                      Text(AppStrings.appName.toUpperCase(), style: AppTextStyles.display(56)),
                      AppSpacing.h8,
                      Text(AppStrings.tagline, style: AppTextStyles.caption.copyWith(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 140,
              child: Obx(() => AppLinearProgress(value: controller.progress.value)),
            ),
            AppSpacing.h12,
            Text(AppStrings.loadingPlan, style: AppTextStyles.small),
            AppSpacing.h8,
            Text(AppStrings.version, style: AppTextStyles.small),
          ],
        ),
      );
}
