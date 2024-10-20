import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/orders/pendingorder_controller.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class Custtomdetails extends GetView<PendingorderController> {
  final myOrders myOrdersModel;

  const Custtomdetails({super.key, required this.myOrdersModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "TotalPrice: ${myOrdersModel.ordersTotalprice}\$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        if (myOrdersModel.ordersStatus == 3)
          MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.black,
            onPressed: () {
              controller.goToTrackingOrder(myOrdersModel);
            },
            child: const Text(
              "Tracking",
              style: TextStyle(color: AppColor.white),
            ),
          ),
        const SizedBox(
          width: 5,
        ),
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.black,
          onPressed: () {
            controller.goToDetailsPage(
                myOrdersModel, myOrdersModel.ordersId.toString());
          },
          child: const Text(
            "Details",
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ],
    );
  }
}
