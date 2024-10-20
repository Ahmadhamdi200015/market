import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/data/datasource/remote/auth/signup_data.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  Future<void> SignUp();
  void GoToSign();
  void GoToCheckEmail();
}

class SignupControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController emailSign;
  late TextEditingController passwordSign;
  late TextEditingController userSign;
  late TextEditingController phone;

  SignupData signupData = SignupData(Get.find());
  StatusRequest stateRequest=StatusRequest.none;

  @override
  Future<void> SignUp() async {
    if (formState.currentState!.validate()) {
      stateRequest = StatusRequest.lodaing;
      update();
      try {
        var response = await signupData.postData(
            userSign.text, passwordSign.text, emailSign.text, phone.text
        );
        stateRequest = handlingData(response);
        if (StatusRequest.success == stateRequest) {
          if (response['status'] == "success") {
            print("============================= success");
            await Get.offAllNamed(AppRoute.login);
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Email or phone used before ",
            );
          }
        } else {
          stateRequest = StatusRequest.failure;
        }
      } catch (e) {
        stateRequest = StatusRequest.failure;
        print('SignUp error: $e');
        Get.defaultDialog(
          title: "Error",
          middleText: "An unexpected error occurred.",
        );
      }
      update();
    }
  }

  @override
  void GoToCheckEmail() {
    Get.offAllNamed(AppRoute.VerifiyCodeSign);
  }

  @override
  void GoToSign() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    emailSign = TextEditingController();
    passwordSign = TextEditingController();
    userSign = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailSign.dispose();
    passwordSign.dispose();
    userSign.dispose();
    phone.dispose();
    super.dispose();
  }
}
