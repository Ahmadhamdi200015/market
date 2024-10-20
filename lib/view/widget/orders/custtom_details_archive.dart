import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/orders/archive_order_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:flutterahmad/view/widget/orders/custtom_dialog_rating.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CusttomDetailsArchive extends GetView<ArchiveOrderController> {
  final myOrders myOrdersModel;

  const CusttomDetailsArchive({super.key, required this.myOrdersModel});

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
     const  SizedBox(width: 5,),
       if(myOrdersModel.ordersRating==0)MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.black,
          onPressed: () {
            showCusttomDialogRating(context, myOrdersModel.ordersId.toString());
          },
          child: const Text(
            "Rating",
            style: TextStyle(color: AppColor.white),
          ),
        )
      ],
    );
  }
}
