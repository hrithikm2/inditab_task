import 'package:get/get.dart';

import '../controllers/restaurant_locator_map_controller.dart';

class RestaurantLocatorMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantLocatorMapController>(
      () => RestaurantLocatorMapController(),
    );
  }
}
