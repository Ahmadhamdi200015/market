import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class ItemsData {
  final Crud crud;

  ItemsData(this.crud);

  Future<dynamic> getData(String id, String userid) async {
    var response = await crud
        .dataPost(AppLink.itemsview, {"id": id.toString(), "userid": userid});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> searchData(String search) async {
    var response = await crud.dataPost(AppLink.searchView,{
      "search":search
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }


}
