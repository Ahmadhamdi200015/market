import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController{
  MyService myService = Get.find();

  Logout(){
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${myService.sharedPrefrences.getString("userid")}");
    myService.sharedPrefrences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  GoToAddressPage(){
    Get.toNamed(AppRoute.AddressView);
  }

  GoToArchivePage(){
    Get.toNamed(AppRoute.Archiveorders);
  }
  GoToOrderPage(){
    Get.toNamed(AppRoute.PendingOrders);
  }
  contactUs(){
    launchUrl(Uri.parse("tel:+972 598330425"));
  }
}