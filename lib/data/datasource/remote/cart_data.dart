import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class CartData {
  final Crud crud;

  CartData(this.crud);

  Future<dynamic> AddCart(String userid, String itemsid) async {
    var response = await crud
        .dataPost(AppLink.cartAdd, {"userid": userid, "itemsid": itemsid});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> DeleteCart(String userid, String itemsid) async {
    var response = await crud
        .dataPost(AppLink.cartDelete, {"userid": userid, "itemsid": itemsid});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> GetCountItems(String userid, String itemsid) async {
    var response = await crud
        .dataPost(AppLink.cartgetCount, {"userid": userid, "itemsid": itemsid});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> viewCart(String userid) async {
    var response = await crud.dataPost(AppLink.cartView, {"userid": userid});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> checkCoupon(String CouponName) async {
    var response = await crud.dataPost(AppLink.CouponCheck, {"couponName": CouponName});
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }

}
