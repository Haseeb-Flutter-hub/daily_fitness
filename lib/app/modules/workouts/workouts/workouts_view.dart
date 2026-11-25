import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/utils/app_strings.dart';
import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'workouts_controller.dart';

class WorkoutsView extends GetView<WorkoutsController> {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() {
        // Rx values builder ke andar hi parho, warna Obx unhein track nahi karta.
        final list = controller.filtered;
        final selected = controller.categoryIndex.value;

        return ListView(
          padding: AppSpacing.screen,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(AppStrings.workoutsTitle.toUpperCase(), style: AppTextStyles.display(40)),
                ),
                AppIconButton(
                  icon: Icons.add_rounded,
                  tooltip: 'Create workout',
                  onPressed: controller.openCreate,
                ),
                AppSpacing.w8,
                AppIconButton(
                  icon: Icons.history_rounded,
                  tooltip: 'History',
                  onPressed: controller.openHistory,
                ),
              ],
            ),
            AppSpacing.h16,
            AppSearchField(
              controller: controller.searchController,
              hint: AppStrings.searchExercises,
              onChanged: controller.onQueryChanged,
            ),
            AppSpacing.h16,
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: WorkoutsController.categories.length,
                separatorBuilder: (context, index) => AppSpacing.w8,
                itemBuilder: (context, i) => AppChip(
                  label: WorkoutsController.categories[i],
                  selected: selected == i,
                  onTap: () => controller.selectCategory(i),
                ),
              ),
            ),
            AppSpacing.h16,
            _challengeCard(),
            const SectionHeader(AppStrings.popularExercises),
            if (list.isEmpty)
              const AppEmptyState(
                icon: Icons.search_off_rounded,
                title: AppStrings.noResults,
                message: AppStrings.noResultsMsg,
              )
            else
              for (final e in list) ExerciseTile(e, onTap: () => controller.openExercise(e)),
            AppSpacing.h16,
          ],
        );
      });

  Widget _challengeCard() => AppCard(
        onTap: controller.openChallenge,
        color: AppColors.primaryTint,
        borderColor: AppColors.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTag(AppStrings.challengeTag, filled: true),
            AppSpacing.h12,
            Text(AppStrings.challengeName.toUpperCase(), style: AppTextStyles.display(34)),
            AppSpacing.h8,
            Text(AppStrings.challengeDay(controller.challengeDay), style: AppTextStyles.caption),
            AppSpacing.h12,
            AppLinearProgress(value: controller.challengeProgress, height: 6),
          ],
        ),
      );
}
