import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:get/get.dart';

class MyUserMiddleware extends GetMiddleware{
  @override
  int? get  priority => 0;

  MyService myService=Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(myService.sharedPrefrences.getString("userid")!.isNotEmpty){
      return const RouteSettings(name: AppRoute.HomeScreen);

    }
    return null;

  }

}