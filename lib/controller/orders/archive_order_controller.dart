import 'package:flutterahmad/core/constant/route.dart';
import 'package:flutterahmad/core/funcation/handlingdata.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:flutterahmad/core/services/service.dart';
import 'package:flutterahmad/data/datasource/remote/orders/archive_data.dart';
import 'package:flutterahmad/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class ArchiveOrderController extends GetxController{
  ArchiveData archiveData=ArchiveData(Get.find());
  List<myOrders> ArchiveList=[];
  StatusRequest statusRequest=StatusRequest.none;
  MyService myService=Get.find();

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }


  goToDetailsPage(myOrders myordermodel,String orderId){
    Get.toNamed(AppRoute.DetailsOrders,arguments: {
      "myorders":myordermodel,
      "orderId":myordermodel.ordersId
    });
  }

  String printTypeOrder(val){
    if(val.toString()=="0"){
      return "delivery";
    }else{
      return "recive";
    }
  }
  String printmethodOrder(val){
    if(val.toString()=="0"){
      return "cash";
    }else{
      return "Card";
    }
  }

  String printStatusOrder(val){
    if(val.toString()=="0"){
      return "Pending Approval";
    }else{
      return "Archive";
    }
  }


  getOrders() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await archiveData.getArchive(myService.sharedPrefrences.getString("userid")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonselist=response['data'];
        ArchiveList.addAll(resonselist.map((e)=>myOrders.fromJson(e)));
       print("===============================================");
       print( resonselist[0]['orders_rating']);
        print("===============================================");

      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Orders view not found ",
        );
      }
    } else {
      print("==========================failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  submetRating(String orderId,int rating,String comment)async{
    ArchiveList.clear();
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await archiveData.addRating(orderId,rating,comment);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['data']);
       getOrders();
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Rating not upload ",
        );
      }
    } else {
      print("==========================failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  refreshPage(){
    getOrders();
    update();
  }

}