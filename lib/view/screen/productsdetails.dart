import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/productsdetails_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/productsdetails/custtomiconbtn.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsdetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          title:const Text("Product Details"),
          centerTitle: true,
        ),
        backgroundColor: AppColor.white,
        body: GetBuilder<ProductsdetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  Expanded(flex: 3,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 250,
                              decoration: const BoxDecoration(
                                  color: AppColor.black,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20))),
                            ),
                            Positioned(
                                top: 100,
                                left: 20,
                                right: 20,
                                child: Center(
                                  child: Hero(
                                    tag: "${controller.itemsmodel.itemsId}",
                                    child: Image.network(
                                      "${AppLink.imageitems}/${controller.itemsmodel.itemsImage}",
                                      height: 250,
                                      width: 220,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "${controller.itemsmodel.itemsName}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CusttomIconBtn(
                                      icon: Icons.add,
                                      onPressed: () async {
                                        await controller.add();
                                      }),
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.black, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "${controller.countItems}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  CusttomIconBtn(
                                      icon: Icons.remove,
                                      onPressed: () async {
                                        await controller.delete();
                                      })
                                ],
                              ),
                              Text(
                                "${controller.itemsmodel.itemspricediscount}\$",
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "${controller.itemsmodel.itemsDesc}",
                            style: const TextStyle(color: AppColor.grey),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Text(
                            "Color",
                            style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                alignment: Alignment.center,
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.blacklow,
                                    border: Border.all(
                                        color: AppColor.textColor, width: 1)),
                                child: const Text("Red",
                                    style: TextStyle(color: AppColor.white)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 10),
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColor, width: 1)),
                                child: const Text("Black",
                                    style:
                                    TextStyle(color: AppColor.textColor)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColor, width: 1)),
                                child: const Text(
                                  "Blue",
                                  style: TextStyle(color: AppColor.textColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),),
                  Container(
                    width: 500,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: AppColor.black,
                      onPressed: () {
                        controller.goToCart();
                      },
                      child: const Text(
                        "Go To Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
