import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/homepage_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class CusttomlistItems extends GetView<HomepageControllerImp> {
  const CusttomlistItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(width: 10),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Items(itemsmodel: controller.listData[index]);
        },
      ),
    );
  }
}

class Items extends GetView<HomepageControllerImp> {
  final Itemsmodel itemsmodel;

  const Items({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GoToDetails(itemsmodel);
      },
      child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            child: ListTile(
              leading: Image.network(
                "${AppLink.imageitems}/${itemsmodel.itemsImage}",
                width: 70,
                fit: BoxFit.fill,
                height: 50,
              ),
              title: Text("${itemsmodel.itemsName}"),
              subtitle: Text(
                "Price: ${itemsmodel.itemspricediscount}\$",
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
              trailing: Text("${itemsmodel.itemsPrice}\$",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColor.grey,decoration:TextDecoration.lineThrough),),
            ),
          )),
    );
  }
}
