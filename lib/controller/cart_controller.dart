import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutterahmad/controller/productsdetails_controller.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/cart_data.dart';
import 'package:flutterahmad/data/model/couponmodel.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/funcation/handlingdata.dart';

abstract class CartController extends GetxController {
  add(String itemsId);

  delete(String itemsId);

  getCart();

  checkCoupon();

  getTotalPriceCoupon();

  GoToCheckOut();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  int totalPriceItems = 0;
  int? discountCoupon = 0;
  String? nameCoupon;
  String? couponId;

  var totalCount = 0;
  late Itemsmodel itemsmodel;
  List data = [];
  String totalcoupon = "0";
  MyCouponModel? myCouponModel;

  late TextEditingController coupon;

  @override
  void onInit() {
    print(myService.sharedPrefrences.getString("userid"));
    coupon = TextEditingController();
    getCart();
  }

  @override
  getTotalPriceCoupon() {
    return totalPriceItems - totalPriceItems * discountCoupon! / 100;
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await cartData.checkCoupon(coupon.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> responseCoupon = response['data'];
        myCouponModel = MyCouponModel.fromJson(responseCoupon);
        discountCoupon = (myCouponModel?.CouponDiscount)?.toInt();
        nameCoupon = myCouponModel!.CouponName;
        couponId = myCouponModel?.CouponId.toString();
      } else {
        Get.snackbar("Coupon info", "may Coupon there is not yet");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  refreshView() {
    resetVarData();
    getCart();
  }

  resetVarData() {
    totalPriceItems = 0;
    totalCount = 0;
    discountCoupon = 0;
  }

  @override
  add(itemsId) async {
    statusRequest = StatusRequest.lodaing;
    try {
      var response = await cartData.AddCart(myService.sharedPrefrences.getString("userid")!, itemsId.toString());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "Add Success ");
          ProductsdetailsControllerImp c=Get.put(ProductsdetailsControllerImp());
          c.refreshPage();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  delete(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.lodaing;
    try {
      var response = await cartData.DeleteCart(myService.sharedPrefrences.getString("userid")!, itemsId);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "Delete Success");
          ProductsdetailsControllerImp c=Get.put(ProductsdetailsControllerImp());
          c.refreshPage();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  getCart() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await cartData.viewCart(myService.sharedPrefrences.getString("userid")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("${response['datacart']['data']}");
        data.clear();
        Map responsetotalitems = response["countprice"];
        totalCount = int.parse(responsetotalitems["totalcount"]);
        totalPriceItems =
            int.parse(responsetotalitems["totalprice"].toString());
        data.addAll(response['datacart']['data']);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Categories view not found ",
        );
      }
    } else {
      print("==========================failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void dispose() {
    coupon.dispose();
    super.dispose();
  }

  @override
  GoToCheckOut() {
    Get.offAllNamed(AppRoute.CheckoutPage, arguments: {
      "ordersprice": totalPriceItems,
      "couponid": couponId.toString(),
      "coupondiscounted": discountCoupon.toString()
    });
  }

}
