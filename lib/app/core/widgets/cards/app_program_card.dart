import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/cards/app_card.dart';
import 'package:daily_fitness/app/core/widgets/common/app_tag.dart';

class AppProgramCard extends StatelessWidget {
  final String name;
  final String meta;
  final String level;
  final VoidCallback? onTap;
  final double width;

  const AppProgramCard({
    super.key,
    required this.name,
    required this.meta,
    required this.level,
    this.onTap,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: AppCard(
          onTap: onTap,
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTag(level),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name.toUpperCase(), style: AppTextStyles.h3),
                  AppSpacing.h4,
                  Text(meta, style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
        ),
      );
}
