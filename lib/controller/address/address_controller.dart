import 'package:flutter/cupertino.dart';
import 'package:flutterahmad/controller/address/address_view_controller.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/address_data.dart';
import 'package:flutterahmad/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  MyService myService=Get.find();

  String? lat;
  String? long;


  List<MyAddressModel> data=[];


  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;



  AddAddress() async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await addressData.addAddress(
        "${myService.sharedPrefrences.getString("userid")}",
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "Add Success ");
          AddressViewControllerImp c=Get.find();
          c.getAddress();
          Get.toNamed(AppRoute.HomeScreen);
        }
      } else {
        print("=========================offline");
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print("============================$e");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }



  @override
  void onInit() {
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    super.onInit();
  }
}
