import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/view/screen/NotificationPage.dart';
import 'package:flutterahmad/view/screen/homepage.dart';
import 'package:flutterahmad/view/screen/offerspage.dart';
import 'package:flutterahmad/view/screen/settingspage.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {

  changePage(int i);
  GoToCart();
}
 class HomeScreenControllerImp extends HomeScreenController{
    int currentpage=0;

  List<Widget> listPage=const[
    HomePage(),
    NotificationPage(),
    SettingsPage(),
    OffersPage()
  ];

  List<String> titlebottombar=const[
    "Home",
    "Notification",
    "Settings",
    "Offers"
  ];
  @override
  changePage(int i) {
    currentpage=i;
    update();

  }

  @override
  GoToCart() {
    Get.toNamed(AppRoute.CartPage);
  }




 }