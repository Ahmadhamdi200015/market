import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/homepage_controller.dart';
import 'package:flutterahmad/controller/items_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CusttomlistItems extends GetView<ItemsControllerImp> {
  const CusttomlistItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, i) => const SizedBox(width: 5),
        scrollDirection: Axis.horizontal,
        itemCount: controller.Category.length,
        itemBuilder: (context, index) {
          return Items(
              categoriesmodel:
                  Categoriesmodel.fromJson(controller.Category[index]),
              i: index);
        },
      ),
    );
  }
}

class Items extends GetView<ItemsControllerImp> {
  final int i;
  final Categoriesmodel categoriesmodel;

  const Items({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i,categoriesmodel.categoriesId.toString());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppColor.black, width: 3)))
                  : null,
              child: Text(
                "${categoriesmodel.categoriesName}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColor.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
