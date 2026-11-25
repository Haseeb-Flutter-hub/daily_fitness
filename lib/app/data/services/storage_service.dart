import 'package:get_storage/get_storage.dart';

abstract final class StorageService {
  static final GetStorage _box = GetStorage();

  static Future<void> init() => GetStorage.init();

  // Generic (history jaisi cheezon ke liye)
  static T? read<T>(String key) => _box.read<T>(key);
  static Future<void> write(String key, dynamic value) => _box.write(key, value);

  // Login
  static bool get isLoggedIn => _box.read<bool>('logged_in') ?? false;
  static Future<void> setLoggedIn(bool value) => _box.write('logged_in', value);

  // User
  static String get userName => _box.read<String>('user_name') ?? 'Athlete';
  static Future<void> saveName(String name) => _box.write('user_name', name);

  // Onboarding
  static bool get isOnboarded => _box.read<bool>('onboarded') ?? false;
  static Future<void> setOnboarded(bool value) => _box.write('onboarded', value);

  static int get goalIndex => _box.read<int>('goal_index') ?? 0;
  static Future<void> saveGoal(int index) => _box.write('goal_index', index);

  static int get levelIndex => _box.read<int>('level_index') ?? 0;
  static int get daysPerWeek => _box.read<int>('days_per_week') ?? 4;
  static int get sessionMinutes => _box.read<int>('session_minutes') ?? 20;
  static bool get reminderOn => _box.read<bool>('reminder_on') ?? true;
  static int get reminderHour => _box.read<int>('reminder_hour') ?? 18;
  static int get reminderMinute => _box.read<int>('reminder_minute') ?? 0;

  static Future<void> savePlan({
    required int level,
    required int daysPerWeek,
    required int sessionMinutes,
    required bool reminderOn,
    required int reminderHour,
    required int reminderMinute,
  }) async {
    await _box.write('level_index', level);
    await _box.write('days_per_week', daysPerWeek);
    await _box.write('session_minutes', sessionMinutes);
    await _box.write('reminder_on', reminderOn);
    await _box.write('reminder_hour', reminderHour);
    await _box.write('reminder_minute', reminderMinute);
  }

  static Future<void> setReminderOn(bool value) => _box.write('reminder_on', value);
}
