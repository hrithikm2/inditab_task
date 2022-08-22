import 'package:get/get.dart';

import '../controllers/logged_in_screen_controller.dart';

class LoggedInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoggedInScreenController>(
      () => LoggedInScreenController(),
    );
  }
}
