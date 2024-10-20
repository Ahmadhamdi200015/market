import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/auth/login_data.dart';
import 'package:get/get.dart';

abstract class AuthController extends GetxController {
  Login();

  GoToSign();

  GoToForgetPassword();
}

class LoginControllerImp extends AuthController {
  Map data={};
  MyService myService=Get.find();
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData = LoginData(Get.find());
  StatusRequest stateRequest=StatusRequest.none;
  @override
  Login() async{
    if (formState.currentState!.validate()) {
      stateRequest = StatusRequest.lodaing;
      update();
      try {
        var response = await loginData.postData(
            email.text,
            password.text
        );
        stateRequest = handlingData(response);
        if (StatusRequest.success == stateRequest) {
          if (response['status'] == "success") {
            data.addAll(response['data']);
            myService.sharedPrefrences.setString("userid","${data['users_id']}");
            myService.sharedPrefrences.setString("username",data['users_name']);

            // String usersid=myService.sharedPrefrences.getString("usersid")!;

            FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic("users$usersid");

            print("============================= success");

            await Get.offAllNamed(AppRoute.VerifiyCode);
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Email or phone mistake ",
            );
          }
        } else {
          stateRequest = StatusRequest.failure;
        }
      } catch (e) {
        stateRequest = StatusRequest.failure;
        print('Login error: $e');
        Get.defaultDialog(
          title: "Error",
          middleText: "An unexpected error occurred.",
        );
      }
      update();

    }
  }


  @override
  GoToSign() {
    Get.offAllNamed(AppRoute.Sign);
  }

  @override
  GoToForgetPassword() {
    Get.offAllNamed(AppRoute.ForgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


}
