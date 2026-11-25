import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daily_fitness/app/core/widgets/widgets.dart';
import 'package:daily_fitness/app/modules/home/home/home_view.dart';
import 'package:daily_fitness/app/modules/profile/profile/profile_view.dart';
import 'package:daily_fitness/app/modules/progress/progress/progress_view.dart';
import 'package:daily_fitness/app/modules/workouts/workouts/workouts_view.dart';
import 'main_shell_controller.dart';

class MainShellView extends GetView<MainShellController> {
  const MainShellView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => AppScaffold(
          padding: EdgeInsets.zero,
          bottomNavigationBar: AppBottomNav(
            currentIndex: controller.index.value,
            onTap: controller.changeTab,
          ),
          body: IndexedStack(
            index: controller.index.value,
            children: const [
              HomeView(),
              WorkoutsView(),
              ProgressView(),
              ProfileView(),
            ],
          ),
        ),
      );
}
