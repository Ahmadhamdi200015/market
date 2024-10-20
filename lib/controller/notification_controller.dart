import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

import '../core/funcation/handlingdata.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List notifList = [];
  MyService myService = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  getNotification() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await notificationData
        .getData("${myService.sharedPrefrences.getString("userid")}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        notifList.addAll(response['data']);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Notification view not found ",
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
    getNotification();
    super.onInit();
  }
}
