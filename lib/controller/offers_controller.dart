
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/data/datasource/remote/offers_data.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/constant/route.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<Itemsmodel> offersList = [];


  getOffers() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        offersList.addAll(responseData.map((e) => Itemsmodel.fromJson(e)));
      } else {
        Get.snackbar("No Offers", "there is not Offers");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  GoToProductsDetails(Itemsmodel itemsmodel) {
    Get.toNamed(AppRoute.ProductsDetails, arguments: {
      "itemsModel": itemsmodel,
    });
  }

  @override
  void onInit() {
    getOffers();
    super.onInit();
  }
}
