class Exercise {
  final String name;
  final String muscles;
  final String category;
  final String level;
  final int sets;
  final int? reps;
  final int? seconds;
  final int minutes;
  final int kcal;
  final List<String> steps;

  const Exercise(
    this.name,
    this.muscles,
    this.category,
    this.level, {
    required this.sets,
    this.reps,
    this.seconds,
    required this.minutes,
    required this.kcal,
    this.steps = const [],
  });

  String get label => seconds != null ? '$sets × ${seconds}s' : '$sets × $reps';
}
