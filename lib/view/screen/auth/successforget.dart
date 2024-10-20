import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/view/widget/auth/custtomButtonLogin.dart';
import 'package:get/get.dart';

class SuccessForget extends StatelessWidget {
  const SuccessForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Success Check Verification",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline_outlined,
                size: 200,
                color: AppColor.primaryColor,
              ),
              Text(
                "Success Check Verification",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "we will send you to login page",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                child: CusttomButtonLogin(
                  textbtn: "Login",
                  onPressed: () {
                    Get.offAllNamed(AppRoute.HomeScreen);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
