import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/checkout_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/checkout/custtom_checkout_address.dart';
import 'package:flutterahmad/view/widget/checkout/custtom_checkout_method.dart';
import 'package:flutterahmad/view/widget/checkout/custtom_choose.dart';
import 'package:flutterahmad/view/widget/checkout/custtom_order_type.dart';
import 'package:get/get.dart';

import '../../core/constant/imageasset.dart';
import '../../core/stripe_payment/payment_manger.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        backgroundColor: AppColor.white,
        bottomNavigationBar: Container(
          margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding:const EdgeInsets.symmetric(vertical: 20),
            color: AppColor.black,
            onPressed: () {
              controller.addOrders();
            },
            child: const Text(
              "CheckOut",
              style: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: true,
          title: Text(
            "CheckOut",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView(children: [
                const CusttomChoose(txtChoose: "Choose orders paymentMethod"),
                CusttomCheckoutMethod(
                    txtMethod: "Cash",
                    onTap: () {
                      controller.choosemethod("0");
                    },
                    active: controller.checkMethod == "0" ? true : false),
                CusttomCheckoutMethod(
                  txtMethod: "payment Card",
                  onTap: () {
                    controller.choosemethod("1");
                  },
                  active: controller.checkMethod == "1" ? true : false,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CusttomChoose(txtChoose: "Choose orders Type"),
                Row(
                  children: [
                    CusttomOrderType(
                      myChild: Image.asset(Imageasset.delivery),
                      onTap: () {
                        controller.chooseType("0");
                      },
                      active: controller.checkType == "0" ? true : false,
                    ),
                    CusttomOrderType(
                      myChild: Image.asset(Imageasset.transport),
                      onTap: () {
                        controller.chooseType("1");
                      },
                      active: controller.checkType == "1" ? true : false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.checkType == "0"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const CusttomChoose(
                                txtChoose: "Choose your Address "),
                            controller.listData.isNotEmpty
                                ? ListView.builder(
                                    physics:const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.listData.length,
                                    itemBuilder: (context, index) {
                                      return CusttomCheckoutAddress(
                                        txtAddress:
                                            "${controller.listData[index].AddressName}",
                                        txtStreet:
                                            "${controller.listData[index].AddressStreet}",
                                        onTap: () {
                                          controller.chooseAddress(
                                              "${controller.listData[index].AddressId}");
                                        },
                                        active: controller.checkAddress ==
                                                "${controller.listData[index].AddressId}"
                                            ? true
                                            : false,
                                      );
                                    })
                                : Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: 200,
                                      child: MaterialButton(
                                          color: AppColor.black,
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          onPressed: () {
                                            Get.toNamed(AppRoute.AddressPage);
                                          },
                                          child: const Text(
                                            "Enter Your Address",
                                            style: TextStyle(
                                                color: AppColor.white),
                                          )),
                                    ),
                                  )
                          ])
                    : Container()
              ]),
            ),
          ),
        ));
  }
}
