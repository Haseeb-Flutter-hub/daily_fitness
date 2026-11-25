import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/common/icon_badge.dart';

class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;

  const AppEmptyState({super.key, required this.icon, required this.title, this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconBadge(icon: icon, size: 72, iconSize: 32),
              AppSpacing.h16,
              Text(title, style: AppTextStyles.subtitle),
              if (message != null) ...[
                AppSpacing.h4,
                Text(message!, textAlign: TextAlign.center, style: AppTextStyles.caption),
              ],
            ],
          ),
        ),
      );
}
