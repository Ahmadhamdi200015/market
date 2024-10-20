import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/auth/signup_controller.dart';
import 'package:flutterahmad/core/funcation/alertexitapp.dart';
import 'package:flutterahmad/core/funcation/validinput.dart';
import 'package:flutterahmad/view/widget/auth/custtomButtonLogin.dart';
import 'package:flutterahmad/view/widget/auth/custtomTextFormSign.dart';
import 'package:flutterahmad/view/widget/auth/custtomTextSign.dart';
import 'package:flutterahmad/view/widget/auth/custtomTitle.dart';
import 'package:flutterahmad/view/widget/auth/custtomtextwelcome.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: AppBar(
        centerTitle: true,
        title: Text("17".tr),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: WillPopScope(
          onWillPop: () {
            return AlertExitApp();
          },
          child: GetBuilder<SignupControllerImp>(
              builder: (controller) => HandlingDataView(
                    statusRequest:controller.stateRequest,
                    widget: Container(
                      margin:const
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      alignment: Alignment.center,
                      child: GetBuilder<SignupControllerImp>(
                        builder: (controller) => Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              CusttomTitle(
                                textTitle: "10".tr,
                              ),
                              CusttomTextWelcome(textWelcome: "24".tr),
                              CusttomTextFormSign(
                                  valid: (val) {
                                    return validInput(val!, 3, 20, "username");
                                  },
                                  hintText: "23".tr,
                                  labelText: "20".tr,
                                  iconData: Icons.person_outline,
                                  myController: controller.userSign),
                              CusttomTextFormSign(
                                  valid: (val) {
                                    return validInput(val!, 9, 13, "phone");
                                  },
                                  hintText: "22".tr,
                                  labelText: "21".tr,
                                  iconData: Icons.phone_android_outlined,
                                  myController: controller.phone),
                              CusttomTextFormSign(
                                  valid: (val) {
                                    return validInput(val!, 11, 50, "email");
                                  },
                                  hintText: "12".tr,
                                  labelText: "18".tr,
                                  iconData: Icons.email_outlined,
                                  myController: controller.emailSign),
                              CusttomTextFormSign(
                                  valid: (val) {
                                    return validInput(val!, 8, 30, "password");
                                  },
                                  hintText: "13".tr,
                                  labelText: "19".tr,
                                  iconData: Icons.lock_outline,
                                  myController: controller.passwordSign),
                             const SizedBox(
                                height: 20,
                              ),
                              CusttomButtonLogin(
                                onPressed: () {
                                  controller.SignUp();
                                },
                                textbtn: "17".tr,
                              ),
                             const SizedBox(
                                height: 40,
                              ),
                              CusttomTextSign(
                                textOne: "25".tr,
                                textTow: "26".tr,
                                onTap: () {
                                  controller.GoToSign();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
