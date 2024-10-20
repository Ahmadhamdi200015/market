import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/funcation/getdecodepolyline.dart';
import '../../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.success;
  late myOrders myOrderModel;
  double? deslat;
  double? deslng;
  double? currentlat;
  double? currentlng;
  Set<Polyline> polyLinesSet = {};

  initialData() {
    cameraPosition = CameraPosition(
        target: LatLng(double.parse(myOrderModel.addressLat.toString()),
            double.parse(myOrderModel.addressLong.toString())),
        zoom: 12.7);
    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(double.parse(myOrderModel.addressLat.toString()),
            double.parse(myOrderModel.addressLong.toString()))));
  }

  initPolyline() async {
    deslat = double.parse(myOrderModel.addressLat.toString());
    deslng = double.parse(myOrderModel.addressLong.toString());
    await Future.delayed(const Duration(seconds: 3));
    await getPolyLine(currentlat, currentlng, deslat, deslng);
    update();
  }

  getLocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(myOrderModel.ordersId.toString())
        .snapshots()
        .listen((event) {
      if (event.exists) {
        deslat = event.get("lat");
        deslng = event.get("long");
        updateMarkersDelivery(deslat!, deslng!);
      }
    });
  }

  updateMarkersDelivery(double newLat, double newLng) {
    markers.removeWhere((e) => e.markerId.value == "dest");
    markers.add(Marker(
        markerId: const MarkerId("dest"), position: LatLng(newLat, newLng)));
    update();
  }

  @override
  void onInit() {
    myOrderModel = Get.arguments['ordermodel'];
    initialData();
    getLocationDelivery();
    // initPolyline();
    super.onInit();
  }
}
