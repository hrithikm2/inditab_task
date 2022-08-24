import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/app_constants.dart';

class RestaurantLocatorMapController extends GetxController {
  GoogleMapController? _controller;
  final markersList = <Marker>[].obs;
  final ratingText = "Good".obs;
  bool testing = true;
  String website = "DEFAULT";
  String callback_url =
      "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=<order_id>";
  String result = '';

  CameraPosition initialPosition = const CameraPosition(
      target: LatLng(24.43234, 79.1212), zoom: 14.472, bearing: 23, tilt: 40);

  final count = 0.obs;

  void increment() => count.value++;

  @override
  void dispose() {
    _controller?.dispose();
    markersList.clear();
    super.dispose();
  }

  Future<void> onMapCreated(
      GoogleMapController controller, double latitude, double longitude) async {
    _controller = controller;
    await _controller!
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 20,
      bearing: 0,
      tilt: 0,
    )));
    markersList.add(Marker(
        markerId: const MarkerId('ghar'),
        position: LatLng(latitude, longitude)));
    Future.delayed(const Duration(seconds: 1)).then((value) => update());
  }

  void onRatingChanged(double rating) {
    if (rating <= 2) {
      ratingText.value = "Poor";
    } else if (rating > 4) {
      ratingText.value = "Great";
    } else {
      ratingText.value = "Good";
    }
  }

  Future<void> checkoutToPaymentGateway() async {
    String orderId = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      var response0 = http.post(
          Uri.parse(
              "https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid={mid}&orderId={order-id}"),
          body: {
            "mid": mid,
            "requestType": "Payment",
            "orderId": orderId,
            "callbackUrl": callback_url,
            "websiteName": "WEBSTAGING",
            "txnAmount": "1"
          });
      print("response is $response0");
      var response = AllInOneSdk.startTransaction(
          mid, orderId, "1", "null", callback_url, true, false);
      response.then((value) {
        print(value);

        result = value.toString();
        update();
      }).catchError((onError) {
        if (onError is PlatformException) {
          result = "${onError.message} \n  ${onError.details}";
          update();
        } else {
          result = onError.toString();
          update();
        }
      });
    } catch (e) {
      print("E : $e");
    }
  }
}
