import 'package:get/get.dart';

import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class PermissionController extends GetxController {
  Future<void> turnOn() async {
    // TODO: asli notification permission mangna (permission_handler / flutter_local_notifications)
    await StorageService.setReminderOn(true);
    await _finish();
  }

  Future<void> notNow() async {
    await StorageService.setReminderOn(false);
    await _finish();
  }

  Future<void> _finish() async {
    await StorageService.setOnboarded(true);
    await StorageService.setLoggedIn(true);
    Get.offAllNamed(Routes.home);
  }
}
