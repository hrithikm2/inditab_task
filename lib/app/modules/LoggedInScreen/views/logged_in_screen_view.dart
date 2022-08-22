import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/logged_in_screen_controller.dart';

class LoggedInScreenView extends GetView<LoggedInScreenController> {
  LoggedInScreenView({Key? key}) : super(key: key);
  final loggedinScreenController = Get.put(LoggedInScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoggedInScreenView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'LoggedInScreenView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              child: "Logout".text.make(),
              onPressed: () {
                loggedinScreenController.logout();
              })
        ],
      ),
    );
  }
}
