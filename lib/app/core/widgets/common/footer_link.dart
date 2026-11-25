import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';
import 'package:daily_fitness/app/core/widgets/buttons/app_text_link.dart';

/// "Already have an account? Log in" jaisi line.
class FooterLink extends StatelessWidget {
  final String text;
  final String linkLabel;
  final VoidCallback onTap;

  const FooterLink({super.key, required this.text, required this.linkLabel, required this.onTap});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: AppTextStyles.caption.copyWith(fontSize: 14)),
          AppTextLink(linkLabel, onTap: onTap),
        ],
      );
}
