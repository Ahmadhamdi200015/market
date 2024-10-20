import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/data/datasource/remote/auth/checkemail_data.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  CheackEmail();

}

class ForgetpasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController email;
  StatusRequest? stateRequest;
  CheckEmailData checkEmailData=CheckEmailData(Get.find());

  @override
  CheackEmail()async {
    if(formState.currentState!.validate()){
      stateRequest = StatusRequest.lodaing;
      try {
        var response = await checkEmailData.postData(
          email.text,
        );
        stateRequest = handlingData(response);
        if (StatusRequest.success == stateRequest) {
          if (response['status'] == "success") {
            print("============================= success");
            return Get.offAllNamed(AppRoute.ResetPassword,arguments: {
              "email":email.text,
            });
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Email not found ",
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
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
