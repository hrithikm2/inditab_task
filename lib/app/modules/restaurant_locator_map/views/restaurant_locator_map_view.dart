import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../components/custom_app_bar.dart';
import '../../../../constants/app_constants.dart';
import '../controllers/restaurant_locator_map_controller.dart';

class RestaurantLocatorMapView extends GetView<RestaurantLocatorMapController> {
  RestaurantLocatorMapView(
      this.latitude, this.longitude, this.restname, this.imageUrl,
      {Key? key})
      : super(key: key);
  final double latitude;
  final double longitude;
  final String restname;
  final String imageUrl;
  final restaurantLocatorMapController =
      Get.put(RestaurantLocatorMapController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Locate restaurant',
          isBackButton: true,
        ),
        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                liteModeEnabled: false,
                buildingsEnabled: true,
                markers: Set<Marker>.of(
                    restaurantLocatorMapController.markersList.value),
                initialCameraPosition:
                    CameraPosition(target: LatLng(latitude, longitude)),
                onMapCreated: (controller) => restaurantLocatorMapController
                    .onMapCreated(controller, latitude, longitude),
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onTap: (tapped) {},
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        title: "Hotel $restname".text.make(),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl)),
                        subtitle: "Mumbai".text.make(),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                                " 4.6/5".text.makeCentered()
                              ],
                            ),
                            "1000+".text.xs.make()
                          ],
                        )),
                    10.heightBox,
                    "Rate this restaurant".text.white.make(),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 40,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      onRatingUpdate: (rating) {
                        restaurantLocatorMapController.onRatingChanged(rating);
                      },
                    ),
                    Obx(() => restaurantLocatorMapController
                        .ratingText.value.text
                        .make()),
                    20.heightBox,
                    MaterialButton(
                      minWidth: W(context) * 70,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        restaurantLocatorMapController
                            .checkoutToPaymentGateway();
                      },
                      child: "Checkout".text.make(),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
