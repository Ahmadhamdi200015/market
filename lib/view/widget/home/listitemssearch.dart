import 'package:flutter/material.dart';
import 'package:flutterahmad/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../controller/homepage_controller.dart';
import '../../../core/constant/color.dart';

class ListItemsSearch extends GetView<HomepageControllerImp> {
  final List<Itemsmodel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              controller.GoToDetails(listDataModel[index]);
            },
            child: Card(
              color: AppColor.white,
              elevation: 2.0,
              child: ListTile(
                title: Text("${listDataModel[index].itemsName}"),
                subtitle: Text("${listDataModel[index].itemsDesc}"),
                trailing: Text(
                  "${listDataModel[index].itemsPrice}\$",
                  style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                      fontSize: 15),
                ),
                leading: Image.network(
                  "${AppLink.imageitems}/${listDataModel[index].itemsImage}",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }
}
