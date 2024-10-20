import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class CheckoutData {
  final Crud crud;

  CheckoutData(this.crud);

  Future<dynamic> addData(
    String usersid,
    String addressid,
    String orderstype,
    String pricedelivery,
    String orderprice,
      String couponid,
      String coupondis,
      String paymentmethod
  ) async {
    var response = await crud.dataPost(AppLink.CheckOut, {
      "usersid": usersid.toString(),
      "addressid": addressid.toString(),
      "orderstype": orderstype.toString(),
      "pricedelivery": pricedelivery,
      "ordersprice": orderprice,
      "couponid": couponid,
      "coupondiscount": coupondis,
      "paymentmethod": paymentmethod.toString()
    });
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }
}
