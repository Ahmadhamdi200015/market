

import 'dart:async';

import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAddressController extends GetxController{
  StatusRequest statusRequest=StatusRequest.lodaing;
  List<Marker> marker=[];
  CameraPosition? kGooglePlex;
  Position? position;
  double? lat;
  double? long;
  Completer<GoogleMapController>? controller;

  goToContinueAdd(){
    Get.toNamed(AppRoute.AddressPage,arguments: {
      "lat":lat.toString(),
      "long":long.toString()
    });
  }

  addMarker(LatLng latLang){
    marker.clear();
    marker.add(Marker(markerId:const MarkerId("1"),position: latLang));
    lat=position!.latitude;
    long=position!.longitude;
    update();
  }
  getCurrentLocation()async{
    position=await Geolocator.getCurrentPosition();
    kGooglePlex =  CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.0
    );
    statusRequest=StatusRequest.none;
    update();
  }




@override
  void onInit() {
  controller=Completer<GoogleMapController>();
  getCurrentLocation();
    super.onInit();
  }


}