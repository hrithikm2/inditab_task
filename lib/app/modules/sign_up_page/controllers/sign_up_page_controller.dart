import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inditab_task/app/modules/LoggedInScreen/views/logged_in_screen_view.dart';
import 'package:inditab_task/constants/app_constants.dart';

class SignUpPageController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final count = 0.obs;

  void increment() => count.value++;

  Future<void> registerUserData() async {
    await FirebaseAuth.instance.currentUser
        ?.updateDisplayName(firstNameController.text + lastNameController.text);
    await userCol.doc(user?.uid).set({
      'first name': firstNameController.text,
      'last name': lastNameController.text
    });
    Get.off(LoggedInScreenView());
  }
}
