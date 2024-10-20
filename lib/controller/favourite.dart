import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/favourite_data.dart';
import 'package:get/get.dart';

import '../core/funcation/handlingdata.dart';

class FavouriteController extends GetxController {
  Map isFavourite = {};

  setFavourite(id, val) {
    isFavourite[id] = val;
    update();
  }

  FavouriteData favouriteData = FavouriteData(Get.find());
  late StatusRequest stateRequest;
  MyService myService = Get.find();

  AddFav(String itemsid) async {
    stateRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await favouriteData.AddFavourite(
          myService.sharedPrefrences.getString("userid")!, itemsid);
      stateRequest = handlingData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
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
  }

  RemoveFav(String itemsid) async {
    stateRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await favouriteData.RemoveFavourite(
          myService.sharedPrefrences.getString("userid")!, itemsid);
      stateRequest = handlingData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
          print("============================= success");
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "favourite view not found ",
          );
        }
      } else {
        stateRequest = StatusRequest.failure;
      }
    } catch (e) {
      stateRequest = StatusRequest.failure;
      print('favourite view error: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred.",
      );
    }
  }
}
