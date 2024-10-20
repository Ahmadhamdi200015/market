import 'dart:ffi';

import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/cart_data.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductsdetailsController extends GetxController {
  initData();

  addItems(String itemsId);

  deleteItems(String itemsId);

  getCountItems(String itemsId);

  goToCart();

  add();

  delete();

  refreshPage();
}

class ProductsdetailsControllerImp extends ProductsdetailsController {
  CartData cartData = CartData(Get.find());
  MyService myService = Get.find();
  late Itemsmodel itemsmodel;
  StatusRequest statusRequest = StatusRequest.none;
  int countItems = 0;
  double totalprice = 0.0;

  @override
  void onInit() {
    itemsmodel = Get.arguments['itemsModel'];
    countItems = 0;
    initData();
    super.onInit();
  }

  @override
  addItems(itemsId) async {
    statusRequest = StatusRequest.lodaing;
    try {
      var response = await cartData.AddCart(
          myService.sharedPrefrences.getString("userid").toString(),
          itemsId.toString());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "Add product Success to Cart ");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print("e:$e=======================");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  deleteItems(itemsId) async {
    statusRequest = StatusRequest.lodaing;
    try {
      var response = await cartData.DeleteCart(
          myService.sharedPrefrences.getString("userid").toString(), itemsId);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "Delete product Success from Cart ");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print("$e");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  add() {
    addItems(itemsmodel.itemsId.toString());
    countItems++;
    update();
  }

  @override
  delete() {
    if (countItems > 0) {
      deleteItems(itemsmodel.itemsId.toString());
      countItems--;
    }

    update();
  }

  @override
  getCountItems(itemsId) async {
    statusRequest = StatusRequest.lodaing;
    try {
      Map response = await cartData.GetCountItems(
          myService.sharedPrefrences.getString("userid")!, itemsId);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          countItems = 0;
          countItems = response['data'];
          return countItems;
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
  initData() async {
    await getCountItems(itemsmodel.itemsId.toString());
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.CartPage);
  }

  @override
  refreshPage() {
    countItems = 0;
    initData();
    update();
  }
}
