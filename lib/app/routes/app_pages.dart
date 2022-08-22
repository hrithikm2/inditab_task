import 'package:get/get.dart';

import '../modules/LoggedInScreen/bindings/logged_in_screen_binding.dart';
import '../modules/LoggedInScreen/views/logged_in_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';

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
  ];
}
