import 'package:flutter/cupertino.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/items_data.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  getItems(String categoryId, String userid);

  initalData();

  changeCat(int val, String catval);

  GoToProductsDetails(Itemsmodel? itemsmodel);
}

class ItemsControllerImp extends ItemsController {
  late TextEditingController searchtext;
  MyService myService = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  List item = [];
  List Category = [];
  late String Catid;

  late int selectedCat;

  StatusRequest stateRequest = StatusRequest.none;

  @override
  void onInit() {
    searchtext=TextEditingController();
    initalData();
    super.onInit();
  }

  @override
  initalData() {
    Category = Get.arguments["Categories"];
    selectedCat = Get.arguments["selectedCat"];
    Catid = Get.arguments['Catid'];
    getItems(Catid,"${myService.sharedPrefrences.getString("userid")}");
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    Catid = catval;
    getItems(Catid, "${myService.sharedPrefrences.getString("userid")}");
    update();
  }

  @override
  getItems(categoryId, userid) async {
    item.clear();
    stateRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await itemsData.getData(categoryId, userid);

      stateRequest = handlingData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
          item.addAll(response['data']);
          print(response['data']);
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Items view not found ",
          );
        }
      } else {
        stateRequest = StatusRequest.failure;
      }
    } catch (e) {
      stateRequest = StatusRequest.failure;
      print('Items view error: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred.",
      );
    }
    update();
  }

  @override
  GoToProductsDetails(itemsmodel)async {
    await Get.toNamed(AppRoute.ProductsDetails, arguments: {
      "itemsModel": itemsmodel,
    });
  }
  @override
  void dispose() {
    searchtext.dispose();
    super.dispose();
  }
}
