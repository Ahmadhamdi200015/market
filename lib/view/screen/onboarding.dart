import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/onboarding_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/onboarding/custtomslide.dart';
import 'package:flutterahmad/view/widget/onboarding/dotcontroller.dart';
import 'package:get/get.dart';

import '../widget/onboarding/buttoncontroller.dart';

class Onboarding extends GetView<OnboardingControllerimp> {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerimp());
    return const Scaffold(
      backgroundColor: AppColor.white,
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 3, child: CusstomSlideOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  dotController(),
                  SizedBox(
                    height: 40,
                  ),
                  CusttomButtonController(),
                ],
              ))
        ],
      ),
    ));
  }
}
