import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/notification_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/view/widget/auth/handlingdataview.dart';
import 'package:flutterahmad/view/widget/mycart/custtom_app_bar.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return ListView(
      children: [
        const CusttomAppBar(title: "Notification"),
        GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: AppColor.white,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.notifList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:const EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            elevation: 1.0,
                            color: AppColor.white,
                            child: ListTile(
                              title: Text(
                                  "${controller.notifList[index]['notification_title']}"),
                              subtitle: Text(
                                  "${controller.notifList[index]['notification_body']}"),
                              trailing: Text(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppColor.black),
                                  Jiffy.parse(
                                          '${controller.notifList[index]['notification_datetime']}')
                                      .fromNow()),
                            ),
                          ),
                        );
                      }))),
        ),
      ],
    );
  }
}
