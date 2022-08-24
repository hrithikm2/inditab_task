import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inditab_task/app/modules/restaurant_locator_map/views/restaurant_locator_map_view.dart';
import 'package:inditab_task/app/routes/app_pages.dart';
import 'package:inditab_task/components/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../components/image_logo.dart';
import '../../../../constants/app_constants.dart';
import '../controllers/logged_in_screen_controller.dart';

class LoggedInScreenView extends GetView<LoggedInScreenController> {
  LoggedInScreenView({Key? key}) : super(key: key);
  final loggedinScreenController = Get.put(LoggedInScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Nearby Restaurants",
          actions: [
            IconButton(
              onPressed: () {
                loggedinScreenController.goToProfilePage();
              },
              icon: const Icon(Icons.person_rounded, color: Colors.black),
            ),
            IconButton(
                onPressed: () {
                  loggedinScreenController.logout();
                },
                icon: const Icon(Icons.logout_rounded, color: Colors.black))
          ],
        ),
        body: ListView(
          children: [
            20.heightBox,
            FutureBuilder<QuerySnapshot>(
                future:
                    FirebaseFirestore.instance.collection("Restaurants").get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(H(context) * 2.2),
                                  child: SizedBox(
                                      width: W(context) * 40,
                                      //height: H * 10,
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          //side: BorderSide(color: Colors.white70, width: 1),
                                          borderRadius: BorderRadius.circular(
                                              W(context) * 5),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: (H(context) * 8) + 5,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              "${snapshot.data?.docs[index]['name']}"
                                                  .firstLetterUpperCase()
                                                  .text
                                                  .semiBold
                                                  .xl
                                                  .align(TextAlign.center)
                                                  .makeCentered(),
                                              MaterialButton(
                                                  onPressed: () {
                                                    Get.toNamed(
                                                        Routes
                                                            .RESTAURANT_LOCATOR_MAP,
                                                        arguments: RestaurantLocatorMapView(
                                                            snapshot
                                                                .data
                                                                ?.docs[index]
                                                                    ['location']
                                                                .latitude,
                                                            snapshot
                                                                .data
                                                                ?.docs[index]
                                                                    ['location']
                                                                .longitude,
                                                            snapshot.data?.docs[
                                                                index]['name'],
                                                            snapshot.data?.docs[
                                                                    index]
                                                                ["imageurl"]));
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.directions,
                                                        color: Colors.blue,
                                                        size: 18,
                                                      ),
                                                      "View Directions"
                                                          .text
                                                          .xs
                                                          .make()
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: ImageLogo(
                                        imageUrl: snapshot.data?.docs[index]
                                            ['imageurl']))
                              ],
                            ),
                          );
                        });
                  }
                }),
          ],
        ));
  }
}
