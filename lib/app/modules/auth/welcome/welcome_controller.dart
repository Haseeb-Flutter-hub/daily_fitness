import 'package:get/get.dart';

import 'package:daily_fitness/app/routes/app_routes.dart';

class WelcomeController extends GetxController {
  void onGetStarted() => Get.toNamed(Routes.signUp);
  void onHaveAccount() => Get.toNamed(Routes.login);
}
