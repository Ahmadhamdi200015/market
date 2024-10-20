import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/favourite.dart';
import 'package:flutterahmad/controller/items_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/custtomappbar.dart';
import 'package:flutterahmad/view/widget/items/custtomgeidItem.dart';
import 'package:flutterahmad/view/widget/items/custtomlsititems.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavouriteController controllerfav = Get.put(FavouriteController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Items View"),
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0,
        ),
        backgroundColor: AppColor.white,
        body: Container(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: GetBuilder<ItemsControllerImp>(
              builder: (contoller) => ListView(
                    children: [
                      const CusttomlistItems(),
                      HandlingDataView(
                        statusRequest: contoller.stateRequest,
                        widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                            itemCount: contoller.item.length,
                            itemBuilder: (context, index) {
                              controllerfav.isFavourite[contoller.item[index]
                                      ["items_id"]] =
                                  contoller.item[index]["favourite"];
                              return CusttomGridItem(
                                  itemsmodel: Itemsmodel.fromJson(
                                      contoller.item[index]));
                            }),
                      )
                    ],
                  )),
        ));
  }
}
