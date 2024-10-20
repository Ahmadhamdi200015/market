import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutterahmad/controller/auth/checkemail_controller.dart';
import 'package:flutterahmad/view/widget/auth/custtomTextFormSign.dart';
import 'package:flutterahmad/view/widget/auth/custtomTitle.dart';
import 'package:flutterahmad/view/widget/auth/custtomtextwelcome.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class VerifiyCodeSign extends StatelessWidget {
  const VerifiyCodeSign({super.key});

  @override
  Widget build(BuildContext context) {
    CheckemailControllerImp controller =Get.put(CheckemailControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: AppBar(
        centerTitle: true,
        title: Text("Check Email",style:Theme.of(context).textTheme.headlineLarge,),
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CusttomTitle(textTitle: "Verifiy Code"),
            const CusttomTextWelcome(
                textWelcome: "We texted you a code \n please enter it below"),
            OtpTextField(
              margin: const EdgeInsets.only(right: 15),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.GoToSuccessPage();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
