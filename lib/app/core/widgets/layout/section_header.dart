import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/buttons/app_text_link.dart';

/// Section ka title (aur optional "See all").
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const SectionHeader(this.title, {super.key, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 12),
        child: Row(
          children: [
            Expanded(child: Text(title, style: AppTextStyles.title)),
            if (actionLabel != null) AppTextLink(actionLabel!, onTap: onAction),
          ],
        ),
      );
}
