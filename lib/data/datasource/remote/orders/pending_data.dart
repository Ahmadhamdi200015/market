import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class PendingData {
  final Crud crud;

  PendingData(this.crud);

  Future<dynamic> getPending(String usersid) async {
    var response = await crud.dataPost(AppLink.pendingOrder,{
      "id":usersid.toString()
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> removeOrder(String orderId) async {
    var response = await crud.dataPost(AppLink.deleteOrder,{
      "id":orderId.toString()
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
}