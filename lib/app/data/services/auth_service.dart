/// DEV ONLY: backend na hone tak test login.
/// Asli backend aane par is file ko API call se badal do.
abstract final class AuthService {
  static const devEmail = 'haseebahmadnasir@gmail.com';
  static const devPassword = 'developer';
  static const devName = 'Haseeb';

  static bool isValid(String email, String password) =>
      email.trim().toLowerCase() == devEmail && password == devPassword;
}
