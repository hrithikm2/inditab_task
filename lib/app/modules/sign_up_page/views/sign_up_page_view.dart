import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../components/custom_app_bar.dart';
import '../../../../constants/app_constants.dart';
import '../controllers/sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  SignUpPageView({Key? key}) : super(key: key);
  final signUpController = Get.put(SignUpPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Sign up"),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
              child: Padding(
            padding:
                EdgeInsets.only(left: W(context) * 4, right: W(context) * 4),
            child: ListView(children: [
              HeightBox(H(context) * 3),

              //"Your beautiful name and contact details will be needed to deliver the delicious food to you".text.xs.align(TextAlign.center).makeCentered(),
              HeightBox(H(context) * 3),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: signUpController.firstNameController,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          iconColor: Colors.red,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          label: Text("First Name"),
                          alignLabelWithHint: true,
                          prefix: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                          )),
                    ),
                    HeightBox(H(context) * 3),
                    TextFormField(
                      controller: signUpController.lastNameController,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          iconColor: Colors.red,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          label: Text("Last Name"),
                          alignLabelWithHint: true,
                          prefix: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                          )),
                    ),
                    HeightBox(H(context) * 6),
                    MaterialButton(
                      height: H(context) * 7,
                      minWidth: context.screenWidth / 2.5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.red,
                      onPressed: () {
                        signUpController.registerUserData();
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
        ));
  }
}
