import 'package:get/get.dart';

import '../modules/LoggedInScreen/bindings/logged_in_screen_binding.dart';
import '../modules/LoggedInScreen/views/logged_in_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/restaurant_locator_map/bindings/restaurant_locator_map_binding.dart';
import '../modules/restaurant_locator_map/views/restaurant_locator_map_view.dart';
import '../modules/sign_up_page/bindings/sign_up_page_binding.dart';
import '../modules/sign_up_page/views/sign_up_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => LoginScreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGGED_IN_SCREEN,
      page: () => LoggedInScreenView(),
      binding: LoggedInScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_PAGE,
      page: () => SignUpPageView(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_LOCATOR_MAP,
      page: () {
        RestaurantLocatorMapView restaurantLocatorMapView = Get.arguments;
        return restaurantLocatorMapView;
      },
      binding: RestaurantLocatorMapBinding(),
    ),
  ];
}
