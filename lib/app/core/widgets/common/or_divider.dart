import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  final String text;
  const OrDivider({super.key, this.text = 'or'});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Expanded(child: Divider(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(text, style: AppTextStyles.small),
          ),
          const Expanded(child: Divider(height: 1)),
        ],
      );
}
