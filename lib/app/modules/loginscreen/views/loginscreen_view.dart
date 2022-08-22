import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';

import '../controllers/loginscreen_controller.dart';

class LoginScreenView extends GetView<LoginscreenController> {
  final loginScreenController = Get.put(LoginscreenController());
  LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FlutterLogin(
          onSignup: (signupData) =>
              loginScreenController.registerUserWithEmailPass(signupData),
          hideForgotPasswordButton: true,
          theme: LoginTheme(primaryColor: Colors.red),
          logo: const AssetImage('assets/images/inditab_ham.png'),
          onLogin: (loginData) =>
              loginScreenController.loginWithEmailPass(loginData),
          onRecoverPassword: (recoverPassString) {
            return null;
          },
        ),
      ),
    );
  }
}
