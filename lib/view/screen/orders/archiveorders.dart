import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/orders/archive_order_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/orders/custtomDetails.dart';
import 'package:flutterahmad/view/widget/orders/custtom_details_archive.dart';
import 'package:flutterahmad/view/widget/orders/custtom_dialog_rating.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Archiveorders extends StatelessWidget {
  const Archiveorders({super.key});

  @override
  Widget build(BuildContext context) {
    myOrders? myordermodel;
    ArchiveOrderController controller = Get.put(ArchiveOrderController());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          "Archive Orders",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<ArchiveOrderController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.ArchiveList.length,
                  itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          elevation: 2.0,
                          color: AppColor.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Number of order : #${controller.ArchiveList[index].ordersId}",
                                        style:const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        Jiffy.parse(
                                                '${controller.ArchiveList[index].ordersDatetime}')
                                            .fromNow(),
                                        style:const TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                      "Type Order : ${controller.printTypeOrder(controller.ArchiveList[index].ordersType)}"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                      "Type payment :  ${controller.printmethodOrder(controller.ArchiveList[index].ordersPaymentmethod)}"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                      "Delivery price :  ${controller.ArchiveList[index].ordersPricedelivery}\$"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                      "Order Status :  ${controller.printStatusOrder(controller.ArchiveList[index].ordersStatus)}"),
                                ),
                                const Divider(),
                                CusttomDetailsArchive(
                                  myOrdersModel: controller.ArchiveList[index],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          )),
    );
  }
}
