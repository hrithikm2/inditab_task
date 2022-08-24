import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inditab_task/app/modules/sign_up_page/views/sign_up_page_view.dart';

import '../../../../constants/app_constants.dart';

class LoginscreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var loginStatus = "fail".obs;
  final count = 0.obs;

  void increment() => count.value++;

  Future<String?> loginWithEmailPass(LoginData loginData) async {
    try {
      User? user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginData.name, password: loginData.password)
          .then((value) {
        return null;
      });
      if (user?.displayName == null) {
        Get.off(SignUpPageView());
      }
      loginStatus.value = "success";
      Get.snackbar("Login success", "Welcome to the app user");
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

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    await userCol.doc(user?.uid).set({
      "first name": user?.displayName?.split(' ')[0],
      'last name': user?.displayName?.split(" ")[1] ?? ""
    });
  }

  Future<void> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? "");

    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    await userCol.doc(user?.uid).set({
      "first name": user?.displayName?.split(' ')[0],
      'last name': user?.displayName?.split(" ")[1] ?? ""
    });
  }
}
