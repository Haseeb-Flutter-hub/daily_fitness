import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/widgets/inputs/app_chip.dart';

/// Chips ki qatar jisme se ek chuna jata hai.
class AppChipGroup extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AppChipGroup({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (var i = 0; i < options.length; i++)
            AppChip(label: options[i], selected: i == selectedIndex, onTap: () => onChanged(i)),
        ],
      );
}
