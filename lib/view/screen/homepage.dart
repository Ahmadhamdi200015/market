import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/homepage_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/auth/custtomTitle.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/custtomappbar.dart';
import 'package:flutterahmad/view/widget/home/custtomitems.dart';
import 'package:flutterahmad/view/widget/home/custtomlistcategories.dart';
import 'package:flutterahmad/view/widget/home/listitemssearch.dart';
import 'package:flutterahmad/view/widget/home/stackadscusttom.dart';
import 'package:flutterahmad/view/widget/home/titleapp.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return GetBuilder<HomepageControllerImp>(
        builder: (controller) =>
            HandlingDataView(
                statusRequest: controller.stateRequest,
                widget: Container(
                  color: AppColor.white,
                  margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView(
                    children: [
                      const AppTitleCusttom(),
                      const SizedBox(
                        height: 10,
                      ),
                      CusttomAppBar(
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                        onPressedSearch: () {
                          controller.onSearchItems();
                        },
                        myController: controller.search,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      !controller.isSearch
                          ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StackAdsCusttom(),
                          SizedBox(
                            height: 20,
                          ),
                          CusttomTitle(textTitle: "Categories"),
                          CusttomlistCategories(),
                          SizedBox(height: 20),
                          CusttomTitle(textTitle: "Top Selling"),
                          SizedBox(
                            height: 10,
                          ),
                          CusttomlistItems()
                        ],
                      )
                          : ListItemsSearch(listDataModel: controller.listData),
                    ],
                  ),
                )));
  }
}
