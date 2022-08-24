import 'package:auth_buttons/auth_buttons.dart';
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
          socialButtons: Padding(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleAuthButton(
                  onPressed: () {
                    loginScreenController.signInWithGoogle();
                  },
                  style: const AuthButtonStyle(
                    buttonType: AuthButtonType.icon,
                    iconType: AuthIconType.secondary,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                FacebookAuthButton(
                  onPressed: () {
                    loginScreenController.signInWithFacebook();
                  },
                  style: const AuthButtonStyle(
                    buttonType: AuthButtonType.icon,
                    iconType: AuthIconType.secondary,
                  ),
                )
              ],
            ),
          ),
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
