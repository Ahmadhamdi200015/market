import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/homepage_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:get/get.dart';

class StackAdsCusttom extends GetView<HomepageControllerImp>{
  const StackAdsCusttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            height: 170,
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "${controller.settings[0]['settings_titlehome']} ",
                    style: const TextStyle(
                        fontFamily: "Sans",
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: Text("${controller.settings[0]['settings_bodyhome']}",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Sans",
                          fontWeight: FontWeight.w900,
                          fontSize: 26)),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: -30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                  color: AppColor.blacklow,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ],
      ),
    );
  }
}