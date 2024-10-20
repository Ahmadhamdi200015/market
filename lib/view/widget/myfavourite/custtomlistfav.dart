import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/favouriteview_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/myfavourite.dart';
import 'package:get/get.dart';

class CusttomListFav extends GetView<FavouriteViewController> {

  const CusttomListFav({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemCount: controller.data.length,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          InkWell(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "${AppLink.imageitems}/${controller.data[index].itemsImage}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "${controller.data[index].itemsName}",
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      "${controller.data[index].itemsDesc}",
                      style: const TextStyle(color: AppColor.grey),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.data[index].itemsPrice}\$",
                          style: const TextStyle(
                              fontFamily: "san",
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
          return null;
        });
  }
}