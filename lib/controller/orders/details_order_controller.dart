import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/data/datasource/remote/orders/details_data.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../core/services/service.dart';

class DetailsOrderController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late myOrders ordermodel;
  int? orderId;
  DetailsData detailsData = DetailsData(Get.find());
  List detailsList = [];
  MyService myService=Get.find();


  @override
  void onInit() {
    InitData();
    getOrders();
    super.onInit();
  }

  InitData() async {
    ordermodel = Get.arguments['myorders'];
    orderId = Get.arguments['orderId'];
    update();
  }

  getOrders() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await detailsData.getDetails(orderId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        detailsList.addAll(response['data']);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Orders view not found ",
        );
      }
    } else {
      print("==========================failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
