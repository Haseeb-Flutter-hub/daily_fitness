abstract final class Validators {
  static String? name(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Name is required';
    if (value.length < 2) return 'Enter your full name';
    return null;
  }

  static String? email(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Email is required';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
    return ok ? null : 'Enter a valid email';
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 8) return 'Use at least 8 characters';
    return null;
  }

  static bool hasNumber(String v) => RegExp(r'[0-9]').hasMatch(v);
  static bool hasSymbol(String v) => RegExp(r'[^A-Za-z0-9]').hasMatch(v);

  static String? strongPassword(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 8 || !hasNumber(v) || !hasSymbol(v)) {
      return 'Password does not meet the rules below';
    }
    return null;
  }

  static String? confirmPassword(String? v, String original) {
    if (v == null || v.isEmpty) return 'Please confirm your password';
    return v == original ? null : 'Passwords do not match';
  }
}
