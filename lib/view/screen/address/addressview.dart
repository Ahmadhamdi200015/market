import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/address/address_view_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewControllerImp controller = Get.put(AddressViewControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(title: const Text("Address View"),centerTitle: true,backgroundColor: AppColor.white,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.black,
        onPressed: () {
          controller.GoToAddAdress();
        },
        child:const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      body: GetBuilder<AddressViewControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        controller.removeAddress(
                            controller.data[index].AddressId.toString());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Card(
                          color: AppColor.white,
                          elevation: 2.0,
                          child: ListTile(
                            title:
                                Text("${controller.data[index].AddressCity}"),
                            trailing: Text(
                              "${controller.data[index].AddressName}",
                              style:const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blacklow),
                            ),
                            subtitle:
                                Text("${controller.data[index].AddressStreet}"),
                          ),
                        ),
                      ),
                    );
                  },
                ))),
      ),
    );
  }
}
