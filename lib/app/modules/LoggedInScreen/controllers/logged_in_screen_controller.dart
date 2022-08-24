import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inditab_task/app/modules/home/views/home_view.dart';
import 'package:inditab_task/app/modules/profile_page/views/profile_page_view.dart';

class LoggedInScreenController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    print("init");
    super.onInit();
  }

  void increment() => count.value++;

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(const HomeView());
  }

  void goToProfilePage() => Get.to(() => const ProfilePageView());
}
