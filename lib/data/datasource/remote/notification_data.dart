import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class NotificationData {
  final Crud crud;

  NotificationData(this.crud);

  Future<dynamic> getData(String id) async {
    var response = await crud.dataPost(AppLink.notificationOrder, {"id": id});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }
}
