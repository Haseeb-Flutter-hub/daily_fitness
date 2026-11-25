import 'package:daily_fitness/app/data/models/workout_log.dart';

/// Logs se rings, streak aur hafte ke graphs ke numbers nikalta hai.
class ProgressStats {
  final List<WorkoutLog> logs;
  final DateTime now;
  const ProgressStats(this.logs, this.now);

  static DateTime dayOf(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime get today => dayOf(now);

  List<WorkoutLog> get todayLogs => logs.where((l) => dayOf(l.at) == today).toList();
  int get exercisesToday => todayLogs.length;
  int get minutesToday => todayLogs.fold<int>(0, (s, l) => s + l.minutes);
  int get kcalToday => todayLogs.fold<int>(0, (s, l) => s + l.kcal);

  Set<DateTime> get activeDays => logs.map((l) => dayOf(l.at)).toSet();

  /// Lagatar din: aaj (ya aaj na hua to kal) se peeche ki taraf.
  int get streak {
    final days = activeDays;
    var d = today;
    if (!days.contains(d)) d = DateTime(d.year, d.month, d.day - 1);
    var count = 0;
    while (days.contains(d)) {
      count++;
      d = DateTime(d.year, d.month, d.day - 1);
    }
    return count;
  }

  /// Is hafte ke 7 din (Mon..Sun)
  List<DateTime> get weekDays {
    final monday = DateTime(now.year, now.month, now.day - (now.weekday - 1));
    return List.generate(7, (i) => DateTime(monday.year, monday.month, monday.day + i));
  }

  Set<DateTime> get completedThisWeek => weekDays.where(activeDays.contains).toSet();

  /// Hafte ke graph ke liye: har din ke minutes (Mon..Sun)
  List<int> get weekMinutes => weekDays
      .map((d) => logs.where((l) => dayOf(l.at) == d).fold<int>(0, (s, l) => s + l.minutes))
      .toList();

  int get weekTotalMinutes => weekMinutes.fold<int>(0, (a, b) => a + b);
}
