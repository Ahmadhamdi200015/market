import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/address/address_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/address/app_bar_address.dart';
import 'package:flutterahmad/view/widget/address/custtom_button_address.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/mycart/custtom_app_bar.dart';
import 'package:get/get.dart';

import '../../widget/address/custtom_form_address.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<AddressController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                margin: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    const CusttomAppBar(title: "Add Address"),
                    CusttomFormAddress(
                      mycontroller: controller.city,
                      hintText: "Enter your City",
                      labelText: "City",
                    ),
                    CusttomFormAddress(
                      mycontroller: controller.street,
                      hintText: "Enter your Street",
                      labelText: "Street",
                    ),
                    CusttomFormAddress(
                      mycontroller: controller.name,
                      hintText: "Enter your Name",
                      labelText: "Title",
                    ),
                    CusttomButtonAddress(
                        onPressed: () {
                          controller.AddAddress();
                        }, child: const Text("Add To Address"))
                  ],
                ))),
      ),
    );
  }
}
