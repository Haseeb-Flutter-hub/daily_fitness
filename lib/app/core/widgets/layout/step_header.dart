import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/widgets/progress/app_linear_progress.dart';

/// Onboarding ke upar ki progress bar (step / total).
class StepHeader extends StatelessWidget {
  final int step;
  final int total;
  const StepHeader({super.key, required this.step, required this.total});

  @override
  Widget build(BuildContext context) => AppLinearProgress(value: step / total, height: 6);
}
