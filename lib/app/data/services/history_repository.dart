import 'package:daily_fitness/app/data/models/workout_log.dart';
import 'package:daily_fitness/app/data/sample_data.dart';
import 'package:daily_fitness/app/data/services/storage_service.dart';

/// Workout history local storage mein. Backend aane par yahi file badlegi.
abstract final class HistoryRepository {
  static const _logsKey = 'workout_logs';
  static const _seededKey = 'history_seeded';

  static List<WorkoutLog> all() {
    final raw = StorageService.read<List>(_logsKey);
    if (raw == null) return [];
    return raw.map((e) => WorkoutLog.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  }

  static Future<void> add(WorkoutLog log) async {
    final list = all()..add(log);
    await _save(list);
  }

  static Future<void> _save(List<WorkoutLog> list) =>
      StorageService.write(_logsKey, list.map((l) => l.toJson()).toList());

  /// Pehli baar demo history banao (graphs aur streak khali na dikhen).
  static Future<void> seedIfNeeded() async {
    if (StorageService.read<bool>(_seededKey) == true) return;
    await reseed();
  }

  static Future<void> reseed() async {
    final now = DateTime.now();
    final logs = <WorkoutLog>[];

    // Pichle dinon mein poore workouts (kuch din chhute huay: 4, 7)
    for (final back in const [1, 2, 3, 5, 6, 8, 9]) {
      final day = DateTime(now.year, now.month, now.day - back, 7, 30);
      for (var i = 0; i < todaysPlan.length; i++) {
        final e = todaysPlan[i];
        logs.add(WorkoutLog(
          exercise: e.name,
          at: day.add(Duration(minutes: i * 5)),
          minutes: e.minutes,
          kcal: e.kcal,
        ));
      }
    }

    // Aaj: 2 exercises ho chuki hain
    for (var i = 0; i < 2; i++) {
      final e = todaysPlan[i];
      logs.add(WorkoutLog(
        exercise: e.name,
        at: DateTime(now.year, now.month, now.day, 0, 10 + i),
        minutes: e.minutes,
        kcal: e.kcal,
      ));
    }

    await _save(logs);
    await StorageService.write(_seededKey, true);
  }
}
