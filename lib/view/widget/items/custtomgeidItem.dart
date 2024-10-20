import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/controller/favourite.dart';
import 'package:flutterahmad/controller/items_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class CusttomGridItem extends GetView<ItemsControllerImp> {
  final Itemsmodel itemsmodel;

  const CusttomGridItem({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GoToProductsDetails(itemsmodel);
      },
      child: Hero(
        tag: "${itemsmodel.itemsId}",
        child: Card(
          color: AppColor.white,
          elevation: 2.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "${AppLink.imageitems}/${itemsmodel.itemsImage}",
                height: 100,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "${itemsmodel.itemsName}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                  height: 20,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Rating: 3.5",
                        style: TextStyle(color: AppColor.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(decoration: BoxDecoration(color: AppColor.greenColor,borderRadius: BorderRadius.circular(20)),child: const ClipRRect(child: Icon(Icons.star,size: 20,),))
                    ],
                  )),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsmodel.itemspricediscount}\$",
                      style: const TextStyle(
                          fontFamily: "san",
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                    GetBuilder<FavouriteController>(
                      builder: (contoller) => IconButton(
                          onPressed: () {
                            if (contoller.isFavourite[itemsmodel.itemsId] ==
                                1) {
                              contoller.setFavourite(itemsmodel.itemsId, 0);
                              contoller.RemoveFav(
                                  itemsmodel.itemsId.toString());
                            } else {
                              contoller.setFavourite(itemsmodel.itemsId, 1);
                              contoller.AddFav(itemsmodel.itemsId.toString());
                            }
                          },
                          icon: contoller.isFavourite[itemsmodel.itemsId] == 1
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColor.primaryColor,
                                )
                              : const Icon(Icons.favorite_outline)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
