class WorkoutLog {
  final String exercise;
  final DateTime at;
  final int minutes;
  final int kcal;

  const WorkoutLog({
    required this.exercise,
    required this.at,
    required this.minutes,
    required this.kcal,
  });

  Map<String, dynamic> toJson() => {
        'e': exercise,
        'at': at.toIso8601String(),
        'm': minutes,
        'k': kcal,
      };

  factory WorkoutLog.fromJson(Map<String, dynamic> j) => WorkoutLog(
        exercise: j['e'] as String,
        at: DateTime.parse(j['at'] as String),
        minutes: j['m'] as int,
        kcal: j['k'] as int,
      );
}
