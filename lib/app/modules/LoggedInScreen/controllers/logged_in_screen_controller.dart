import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoggedInScreenController extends GetxController {
  //TODO: Implement LoggedInScreenController

  final count = 0.obs;
  @override
  void onInit() {
    print("init");
    //FirebaseAuth.instance.signOut();
    super.onInit();
  }

  void increment() => count.value++;

  void logout() => FirebaseAuth.instance.signOut();
}
