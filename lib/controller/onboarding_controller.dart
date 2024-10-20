import 'package:flutter/cupertino.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/static/static.dart';
import 'package:flutterahmad/view/screen/auth/login.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController{
  next();

  onPageChanged(int index);

}

class OnboardingControllerimp extends OnboardingController{
  MyService myService=Get.find();
  PageController? pageController;
  int currentpage=0;
  @override
  next() {
    currentpage++;
    if(currentpage>onboardinglist.length-1){
      myService.sharedPrefrences.setString("OnBoarding", "1");
      Get.offAllNamed(AppRoute.login);
    }else{
      pageController?.animateToPage(currentpage, duration: const Duration(milliseconds: 900), curve:Curves.ease);
    }

  }

  @override
  onPageChanged(int index) {
    currentpage=index;
    update();

  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}