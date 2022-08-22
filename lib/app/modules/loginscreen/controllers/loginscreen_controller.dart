import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class LoginscreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var loginStatus = "fail".obs;
  final count = 0.obs;

  void increment() => count.value++;

  Future<String?> loginWithEmailPass(LoginData loginData) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginData.name, password: loginData.password)
          .then((value) {
        loginStatus.value = "success";
        Get.snackbar("Login success", "Welcome to the app user");
      });
    } catch (e) {
      print("E : $e");
      loginStatus.value = "fail";
    }
    return loginStatus.value;
  }

  Future<String?> registerUserWithEmailPass(SignupData signUpData) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpData.name ?? "", password: signUpData.password ?? "");
    } catch (e) {
      print("E : $e");
      loginStatus.value = "fail";
    }
    return loginStatus.value;
  }
}
