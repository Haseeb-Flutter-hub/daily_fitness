import 'package:get/get.dart';

import 'package:daily_fitness/app/data/services/storage_service.dart';
import 'package:daily_fitness/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final progress = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    _start();
  }

  Future<void> _start() async {
    const total = 2400;
    const step = 40;
    for (var t = 0; t <= total; t += step) {
      await Future.delayed(const Duration(milliseconds: step));
      progress.value = t / total;
    }
    Get.offAllNamed(StorageService.isLoggedIn ? Routes.home : Routes.welcome);
  }
}
