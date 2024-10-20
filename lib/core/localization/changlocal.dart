import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/apptheme.dart';
import 'package:flutterahmad/core/funcation/fcmconfig.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  late Locale language;
  MyService myService = Get.find();

  ThemeData appTheme = themeEnglish;

  changelocal(String langcode) {
    Locale locale = Locale(langcode);
    myService.sharedPrefrences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  getRequestPermission()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "Location services are disabled");
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Warning", "Location permissions are denied");
        // return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warning", "Location permissions are permanently denied, we cannot request permissions.");
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void onInit() {
    RequestPermissoinNotification();
    getRequestPermission();
    fcmconfig();
    String? langlo = myService.sharedPrefrences.getString("lang");
    if (langlo == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (langlo == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
