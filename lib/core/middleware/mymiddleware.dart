import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{
  @override
  int? get  priority => 1;

  MyService myService=Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(myService.sharedPrefrences.getString("OnBoarding")=="1"){
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }

}