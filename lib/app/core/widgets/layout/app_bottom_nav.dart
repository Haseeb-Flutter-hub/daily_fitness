import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';

/// Neeche ki 4 tabs: Home, Workouts, Progress, Profile.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});

  static const _items = [
    (Icons.home_rounded, 'Home'),
    (Icons.fitness_center_rounded, 'Workouts'),
    (Icons.bar_chart_rounded, 'Progress'),
    (Icons.person_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: onTap,
          destinations: [
            for (final item in _items) NavigationDestination(icon: Icon(item.$1), label: item.$2),
          ],
        ),
      );
}
