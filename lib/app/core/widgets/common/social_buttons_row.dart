import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/widgets/buttons/app_social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  final VoidCallback? onGoogle;
  final VoidCallback? onApple;

  const SocialButtonsRow({super.key, this.onGoogle, this.onApple});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(child: AppSocialButton(label: 'Google', letter: 'G', onPressed: onGoogle)),
          AppSpacing.w12,
          Expanded(child: AppSocialButton(label: 'Apple', letter: 'A', onPressed: onApple)),
        ],
      );
}
