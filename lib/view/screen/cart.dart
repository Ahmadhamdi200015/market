import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/cart_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/mycart/custtom_app_bar.dart';
import 'package:flutterahmad/view/widget/mycart/custtomlistcart.dart';
import 'package:flutterahmad/view/widget/mycart/custtomnavbar.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Itemsmodel? itemsmodel;
    Get.put(CartControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller) => CusttomNavBar(
          mycontroller: controller.coupon,
          onPressed: () async {
            await controller.checkCoupon();
            controller.refreshView();
          },
          txtDiscount: controller.discountCoupon.toString(),
          txtPrice: controller.getTotalPriceCoupon().toString(),
        ),
      ),
      body: Container(
          child: GetBuilder<CartControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const CusttomAppBar(title: "MyCart"),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        color: AppColor.blacklow,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      "You Have ${controller.totalCount} items in Your List",
                      style: const TextStyle(color: AppColor.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CusttomListCart(
                            image:
                                "${AppLink.imageitems}/${controller.data[index]['items_image']}",
                            title:
                                Text("${controller.data[index]['items_name']}"),
                            subtitle:
                                "${controller.data[index]['itemsprice']}\$",
                            textCount:
                                "${controller.data[index]['countitems']}",
                            onAdd: () async {
                              await controller.add(controller.data[index]
                                      ['items_id']
                                  .toString());
                              controller.refreshView();
                            },
                            onDelete: () async {
                              await controller.delete(controller.data[index]
                                      ['items_id']
                                  .toString());
                              controller.refreshView();
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
