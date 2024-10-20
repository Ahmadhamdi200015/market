import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/categories_data.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../data/datasource/remote/items_data.dart';

abstract class HomePageController extends GetxController {
  initlData();

  GotoItems(List Categories, int SelectedCat, String Catid);

  searchData();

  checkSearch(val);

  onSearchItems();

  GoToDetails(Itemsmodel itemsmodel);
}

class HomepageControllerImp extends HomePageController {
  TextEditingController? search;
  MyService myService = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  bool isSearch = false;

  late String name;

  CategoriesData categoriesData = CategoriesData(Get.find());
  List Category = [];
  List item = [];
  List settings = [];

  List<Itemsmodel> listData = [];

  StatusRequest stateRequest = StatusRequest.none;

  @override
  void onInit() {
    search = TextEditingController();
    // NotificationsHelper().getAccessToken();
    // fcmconfig();
    // refire();
    initlData();
    // name = "${myService.sharedPrefrences.getString("username")}";
    super.onInit();
  }

  refire() async {
    print("==================================================");
    String? mytoken = await FirebaseMessaging.instance.getToken();
    print(mytoken);
    print("==================================================");
  }

  @override
  initlData() async {
    stateRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await categoriesData.getData();
      stateRequest = handlingData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
          List resdata = response['items']['data'];
          Category.addAll(response['categories']['data']);
          item.addAll(resdata);
          listData.addAll(resdata.map((e) => Itemsmodel.fromJson(e)));
          settings.addAll(response['settings']['data']);
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Categories view not found ",
          );
        }
      } else {
        stateRequest = StatusRequest.failure;
      }
    } catch (e) {
      stateRequest = StatusRequest.failure;
      print('Categories view error: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred.",
      );
    }
    update();
  }

  @override
  GotoItems(categories, selectedCat, Catid) {
    Get.toNamed(AppRoute.ItemsView, arguments: {
      "Categories": categories,
      "selectedCat": selectedCat,
      "Catid": Catid,
    });
  }

  @override
  searchData() async {
    stateRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await itemsData.searchData(search!.text);
      stateRequest = handlingData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
          listData.clear();
          List responsesearch = response['data'];
          listData.addAll(responsesearch.map((e) => Itemsmodel.fromJson(e)));
          print("============================= success");
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Categories view not found ",
          );
        }
      } else {
        stateRequest = StatusRequest.failure;
      }
    } catch (e) {
      stateRequest = StatusRequest.failure;
      print('Categories view error: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred.",
      );
    }
    update();
  }

  @override
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  @override
  onSearchItems() {
    isSearch = true;
    if (search!.text.isEmpty) return "NoData";
    searchData();
    update();
  }

  @override
  void dispose() {
    search?.dispose();
    super.dispose();
  }

  @override
  GoToDetails(Itemsmodel itemsmodel) {
    Get.toNamed(AppRoute.ProductsDetails, arguments: {
      "itemsModel": itemsmodel,
    });
  }



//======================items view=========================================
}
