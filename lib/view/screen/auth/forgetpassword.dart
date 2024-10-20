import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/auth/forgetpassword_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/core/funcation/validinput.dart';
import 'package:flutterahmad/view/widget/auth/custtomButtonLogin.dart';
import 'package:flutterahmad/view/widget/auth/custtomTextFormSign.dart';
import 'package:flutterahmad/view/widget/auth/custtomTextSign.dart';
import 'package:flutterahmad/view/widget/auth/custtomTitle.dart';
import 'package:flutterahmad/view/widget/auth/custtomtextwelcome.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(ForgetpasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0.0,
      ),
      body:GetBuilder<ForgetpasswordControllerImp>(builder: (controller){
        return  Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CusttomTitle(
                  textTitle: "Forget Password",
                ),
                const CusttomTextWelcome(
                    textWelcome:
                    "Forget Password \n Can You write your Email to send to Verfiy Code"),
                CusttomTextFormSign(
                  valid: (val) {
                    return validInput(val!, 11, 50, "email");
                  },
                  hintText: 'Enter your Email',
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  myController: controller.email,
                ),
                const Spacer(),
                SizedBox(
                    width: double.infinity,
                    child: CusttomButtonLogin(
                      textbtn: "Check",
                      onPressed: () {
                        controller.CheackEmail();
                      },
                    )),
              ],
            ),
          ),
        );
      },)
    );
  }
}
