import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/address_data.dart';
import 'package:flutterahmad/data/datasource/remote/checkout_data.dart';
import 'package:flutterahmad/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../core/funcation/handlingdata.dart';
import '../core/stripe_payment/payment_manger.dart';

class CheckoutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());

  List<MyAddressModel> listData = [];
  MyService myService=Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? checkMethod;
  String? checkType;
  String? checkAddress;

 late int ordersprice;
  String? couponid;
  String? coupondiscount;
  int checkpayment=0;



  addOrders() async {
    if(checkMethod==null||checkType==null||checkAddress==null){
      return  Get.snackbar("Warning", "please Enter All Field");

    }else{
      if(checkMethod=="1"){
        bool check=await PaymentManger.makePayment(ordersprice, "USD");
        if(check){
          statusRequest = StatusRequest.lodaing;
          update();

          var response = await checkoutData.addData(
              "${myService.sharedPrefrences.getString("userid")}",
              checkAddress.toString(),
              checkType!,
              "10",
              ordersprice.toString(),
              couponid!,
              coupondiscount!,
              checkMethod!);
          statusRequest = handlingData(response);
          if (StatusRequest.success == statusRequest) {
            if (response['status'] == "success") {
              Get.snackbar("Success", "checkout Success");
              Get.offAllNamed(AppRoute.HomeScreen);
            }
          } else {
            print("=========================offline");
            statusRequest = StatusRequest.failure;
          }

          update();
        }else{
          return Get.snackbar("Warning Pay Process Failed", "Warning Pay Process Failed");

        }
      }
    }


    // if(checkMethod==null){
    // return  Get.snackbar("Warning", "please Enter your method");
    // }
    // if(checkType==null){
    // return  Get.snackbar("Warning", "please Enter your order type");
    // }
    // if(checkAddress==null){
    // return  Get.snackbar("Warning", "please Enter your address");
    // }

    // statusRequest = StatusRequest.lodaing;
    // update();
    //
    // var response = await checkoutData.addData(
    //     "${myService.sharedPrefrences.getString("userid")}",
    //     checkAddress.toString(),
    //     checkType!,
    //     "10",
    //     ordersprice.toString(),
    //     couponid!,
    //     coupondiscount!,
    //     checkMethod!);
    // statusRequest = handlingData(response);
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    //     Get.snackbar("Success", "checkout Success");
    //     Get.offAllNamed(AppRoute.HomeScreen);
    //   }
    // } else {
    //   print("=========================offline");
    //   statusRequest = StatusRequest.failure;
    // }
    //
    // update();
  }

  getShipingAddress() async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await addressData.getAddress(
        "${myService.sharedPrefrences.getString("userid")}",
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("==================================Success");
          List responselist = response['data'];
          listData.addAll(responselist.map((e) => MyAddressModel.fromJson(e)));
          checkAddress=listData[0].AddressId.toString();
        }
      } else {
        print("=========================offline");
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print("==========================$e");
    }

    update();
  }

  choosemethod(val) {
    checkMethod = val;
    update();
  }

  chooseType(val) {
    checkType = val;
    update();
  }

  chooseAddress(val) {
    checkAddress = val;
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'].toString();
    ordersprice = Get.arguments['ordersprice'];
    coupondiscount = Get.arguments['coupondiscounted'];
    getShipingAddress();
    super.onInit();
  }
}
