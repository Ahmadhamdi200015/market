import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/data/datasource/remote/test_data.dart';
import 'package:flutterahmad/data/model/datamodel.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List<MyDataModel> data = [];
  late StatusRequest stateRequest;

  getData() async {
    stateRequest = StatusRequest.lodaing;
    List<MyDataModel> response = await testData.getData();
    stateRequest = handlingData(response);
    if (StatusRequest.success == stateRequest) {
      data.addAll(response);
    }else{
      print("StatusRequest is failed");

    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
