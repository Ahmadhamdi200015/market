
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/favouriteview_data.dart';
import 'package:flutterahmad/data/datasource/remote/items_data.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:flutterahmad/data/model/myfavourite.dart';
import 'package:get/get.dart';

class FavouriteViewController extends GetxController{

  TextEditingController? search;
  ItemsData itemsData = ItemsData(Get.find());

  MyService myService=Get.find();
  List<MyFavouriteModel> data=[];
  List<Itemsmodel> listData = [];


  FavouriteviewData favouriteviewData=FavouriteviewData(Get.find());
   StatusRequest stateRequest=StatusRequest.none;
  bool isSearch = false;



  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
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

  getData()async {
    stateRequest = StatusRequest.lodaing;
      var response = await favouriteviewData.getData(myService.sharedPrefrences.getString("userid")!);
      stateRequest = handlingData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
          List responselist=response['data'];
          data.addAll(responselist.map((e) => MyFavouriteModel.fromJson(e)));
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Categories view not found ",
          );
        }
      } else {
        stateRequest = StatusRequest.failure;
      }

    update();
  }



  removeData(String favId) {
    var response =  favouriteviewData.deleteData(favId);
      data.removeWhere((e)=>e.favoriteId.toString() == favId.toString());
    update();
  }
}