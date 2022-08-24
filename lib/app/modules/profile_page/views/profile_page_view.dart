import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inditab_task/constants/app_constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../components/custom_app_bar.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Profile",
          isBackButton: true,
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: userDataDoc.get(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VxCircle(
                      radius: 100,
                      backgroundColor: Colors.red,
                      backgroundImage: const DecorationImage(
                          image: AssetImage('assets/images/inditab_ham.png'),
                          fit: BoxFit.contain)),
                  20.heightBox,
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          "First Name : ${data?['first name']}".text.make(),
                          const Divider(),
                          "Last Name: ${data?['last name']}".text.make(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
