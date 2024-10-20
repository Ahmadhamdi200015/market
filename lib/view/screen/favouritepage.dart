import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/favouriteview_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/custtomappbar.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteViewController());
    return Scaffold(
      backgroundColor: AppColor.white,
        body: GetBuilder<FavouriteViewController>(builder: (controller) =>
            HandlingDataView(
              statusRequest: controller.stateRequest, widget: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListView(
                children: [
                  CusttomAppBar(
                    onChanged: (val) {
                      controller.
                      checkSearch
                      (
                      val
                      );
                    },
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    myController: controller.search,
                  ), const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<FavouriteViewController>(
                      builder: (controller) =>
                          HandlingDataView(
                              statusRequest: controller.stateRequest,
                              widget: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.data.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Card(
                                        color: AppColor.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image.network(
                                              "${AppLink
                                                  .imageitems}/${controller
                                                  .data[index].itemsImage}",
                                              height: 100,
                                              fit: BoxFit.fill,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                "${controller.data[index]
                                                    .itemsName}",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.black),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              child: Text(textAlign: TextAlign
                                                  .center,
                                                "${controller.data[index]
                                                    .itemsDesc}",
                                                style: const TextStyle(
                                                    color: AppColor.grey),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${controller.data[index]
                                                        .itemsPrice}\$",
                                                    style: const TextStyle(
                                                        fontFamily: "san",
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: AppColor
                                                            .primaryColor),
                                                  ),
                                                  MaterialButton(
                                                    onPressed: () {
                                                      controller.removeData(
                                                          "${controller
                                                              .data[index]
                                                              .favoriteId}");
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .restore_from_trash_outlined,
                                                      color: AppColor
                                                          .primaryColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }))),
                ],
              ),
            ),),)
    );
  }
}
