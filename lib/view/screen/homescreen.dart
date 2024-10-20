import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/homescreen_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../widget/custtombottombar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.black,
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: AppColor.white,
                ),
                onPressed: () {
                  controller.GoToCart();
                  // Get.toNamed(AppRoute.CartPage);
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar:BottomAppBar(
                color:AppColor.white,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 10,
                  child:  Row(
                      children: [
                        Row(
                          children: [
                            CusttomBottomBar(
                              textBottom: controller.titlebottombar[0],
                              onPressed: () {
                                controller.changePage(0);
                              },
                              active: controller.currentpage == 0 ? true : false,
                              iconBottom: Icons.home_outlined,
                            ),
                            CusttomBottomBar(
                              textBottom: controller.titlebottombar[1],
                              onPressed: () {
                                controller.changePage(1);
                              },
                              active: controller.currentpage == 1 ? true : false,
                              iconBottom: Icons.notifications_none_outlined,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CusttomBottomBar(
                              textBottom: controller.titlebottombar[2],
                              onPressed: () {
                                controller.changePage(2);
                              },
                              active: controller.currentpage == 2 ? true : false,
                              iconBottom: Icons.settings_outlined,
                            ),
                            CusttomBottomBar(
                              textBottom: controller.titlebottombar[3],
                              onPressed: () {
                                controller.changePage(3);
                              },
                              active: controller.currentpage == 3 ? true : false,
                              iconBottom: Icons.local_offer_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),

                ),

              body: WillPopScope(
                child: Container(
                  color: AppColor.white,
                  child: controller.listPage.elementAt(controller.currentpage),
                ),
                onWillPop: () async {
                  Get.defaultDialog(
                      title: "Warning",
                      middleText: "Do you want to exit from App",
                      onCancel: () {},
                      onConfirm: () {
                        exit(0);
                      });
                  return Future.value(false);
                },
              ),
            ));
  }
}
