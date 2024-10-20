import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/offers_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/core/constant/imageasset.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/mycart/custtom_app_bar.dart';
import 'package:get/get.dart';

import '../../applink.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    return Container(
        child: ListView(
      children: [
        const CusttomAppBar(title: "Offers"),
        GetBuilder<OffersController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.offersList.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          height: 200,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: AppColor.greysecond)),
                            child: Center(
                              child: ListTile(
                                leading: Image.network(
                                    width: 80,
                                    height: 150,
                                    fit: BoxFit.fill,
                                    "${AppLink.imageitems}/${controller.offersList[index].itemsImage}"),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        "${controller.offersList[index].itemsName}"),
                                    Text(
                                      "Price : ${controller.offersList[index].itemspricediscount}\$",
                                      style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                    "${controller.offersList[index].itemsDesc}"),
                                trailing: MaterialButton(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: AppColor.black,
                                  onPressed: () {
                                    controller.GoToProductsDetails(
                                        controller.offersList[index]);
                                  },
                                  child: const Text(
                                    "Details",
                                    style: TextStyle(color: AppColor.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))))
      ],
    ));
  }
}
