import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/homepage_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CusttomlistCategories extends GetView<HomepageControllerImp> {
  const CusttomlistCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(width: 5),
        scrollDirection: Axis.horizontal,
        itemCount: controller.Category.length,
        itemBuilder: (context, index) {
          return Category(
              categoriesmodel:
                  Categoriesmodel.fromJson(controller.Category[index]),
              i: index);
        },
      ),
    );
  }
}

class Category extends GetView<HomepageControllerImp> {
  final int i;
  final Categoriesmodel categoriesmodel;

  const Category({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GotoItems(
            controller.Category, i, categoriesmodel.categoriesId.toString());
      },
      child: Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SvgPicture.network(
                width: 50,
                height: 50,
                "${AppLink.image}/${categoriesmodel.categoriesImage}"),
            Text(
              "${categoriesmodel.categoriesName}",
              style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
