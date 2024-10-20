
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/data/datasource/remote/orders/pending_data.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../core/funcation/handlingdata.dart';
import '../../core/services/service.dart';

class PendingorderController extends GetxController {
  PendingData pendingData = PendingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<myOrders> listOrders = [];
  MyService myService = Get.find();

  String? typeorder;
  String? methodorder;
  String? addressorder;

  goToTrackingOrder(myOrders myOrderModel) {
    Get.toNamed(AppRoute.TrackingMap, arguments: {"ordermodel": myOrderModel});
  }

  goToDetailsPage(myOrders myordermodel, String orderId) {
    Get.toNamed(AppRoute.DetailsOrders, arguments: {
      "myorders": myordermodel,
      "orderId": myordermodel.ordersId
    });
  }

  removeOrder(String orderid) async {
    var response = await pendingData.removeOrder(orderid.toString());
    listOrders.removeWhere((e) => e.ordersId.toString() == orderid.toString());
    update();
  }

  String printTypeOrder(val) {
    if (val.toString() == "0") {
      return "delivery";
    } else {
      return "recive";
    }
  }

  String printmethodOrder(val) {
    if (val.toString() == "0") {
      return "cash";
    } else {
      return "Card";
    }
  }

  String printStatusOrder(val) {
    if (val.toString() == "0") {
      return "Pending Approval";
    } else if (val.toString() == "1") {
      return "order is being prepared  ";
    } else if (val.toString() == "2") {
      return "waiting to picked up by delivery man ";
    } else if (val.toString() == "3") {
      return "order on a way ";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await pendingData
        .getPending(myService.sharedPrefrences.getString("userid")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonselist = response['data'];
        listOrders.addAll(resonselist.map((e) => myOrders.fromJson(e)));
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

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
