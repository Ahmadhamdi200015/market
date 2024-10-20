import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/address_data.dart';
import 'package:flutterahmad/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';

abstract class AddressViewController extends GetxController {
  GoToAddAdress();

  getAddress();

  removeAddress(String addressId);
}

class AddressViewControllerImp extends AddressViewController {
  List<MyAddressModel> data = [];

  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService=Get.find();

  @override
  void onInit() {
    print("ahmad=====================");
    getAddress();
    super.onInit();
  }

  @override
  GoToAddAdress() {
    Get.toNamed(AppRoute.MapAddressPage);
  }

  @override
  getAddress() async {
    data.clear();
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await addressData.getAddress(
      "${myService.sharedPrefrences.getString("userid")}",
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responselist = response['data'];
        data.addAll(responselist.map((e) => MyAddressModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  removeAddress(addressId) async {
      var response = await addressData.removeAddress(addressId.toString());
            data.removeWhere(
              (e) => e.AddressId.toString() == addressId.toString());
    update();
  }
}
