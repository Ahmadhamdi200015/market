import 'package:flutter/material.dart';
import 'package:flutterahmad/controller/settings_controller.dart';
import 'package:flutterahmad/core/constant/color.dart';
import 'package:flutterahmad/core/constant/imageasset.dart';
import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/view/widget/settings/custtom_card_settings.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    return Container(
      color: AppColor.white,
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: AppColor.black,
                height: 150,
              ),
              Positioned(
                bottom: -30,
                left: 170,
                right: 170,
                child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(Imageasset.man),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CusttomCardSettings(
                  textTitle: "Notification",
                  trailing: Icon(Icons.notifications_none_outlined),
                ),
                CusttomCardSettings(
                  textTitle: "Address",
                  trailing: const Icon(Icons.location_on_outlined),
                  onTap: () {
                    settingsController.GoToAddressPage();
                  },
                ),
                CusttomCardSettings(
                  textTitle: "Orders",
                  trailing: const Icon(Icons.shopping_bag_outlined),
                  onTap: (){
                    settingsController.GoToOrderPage();
                  },
                ),
                CusttomCardSettings(
                  textTitle: "Archive",
                  trailing: const Icon(Icons.archive_outlined),
                  onTap: (){
                    settingsController.GoToArchivePage();
                  },
                ),
                CusttomCardSettings(
                  textTitle: "Contact us",
                  trailing: const Icon(Icons.phone_android_outlined),
                  onTap: (){
                    settingsController.contactUs();
                  },
                ),
                const CusttomCardSettings(
                  textTitle: "About us",
                  trailing: Icon(Icons.info_outline),
                ),
                CusttomCardSettings(
                  onTap: (){
                    settingsController.Logout();
                  },
                  textTitle: "Log Out",
                  trailing: const Icon(Icons.login_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
