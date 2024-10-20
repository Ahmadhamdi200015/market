import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/orders/details_order_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:get/get.dart';

import '../../../applink.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsOrderController controller = Get.put(DetailsOrderController());
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text(
            "Details Order",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<DetailsOrderController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                children: [
                  Card(
                    elevation: 2.0,
                      color: AppColor.white,
                      child: Table(
                        children: [
                          TableRow(children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text(
                                "City",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Street",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Price Delivery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.ordermodel.addressCity}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.ordermodel.addressStreet}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.ordermodel.ordersPricedelivery}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: AppColor.primaryColor),
                              ),
                            ),
                          ])
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                        color: AppColor.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "TotalPrice",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${controller.ordermodel.ordersTotalprice}\$",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.detailsList.length,
                      itemBuilder: (context, index) => Container(
                            child: Card(
                              elevation: 2.0,
                              color: AppColor.white,
                              child: Column(
                                children: [
                                  Image.network(
                                      "${AppLink.imageitems}/${controller.detailsList[index]['items_image']}"),
                                  Text(
                                    "${controller.detailsList[index]['items_name']}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "${controller.detailsList[index]['items_desc']}",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ));
  }
}
