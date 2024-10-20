import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class FavouriteviewData {
  final Crud crud;

  FavouriteviewData(this.crud);

  Future<dynamic> getData(String userid) async {
    var response = await crud.dataPost(AppLink.favView, {"id": userid});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> deleteData(String favid) async {
    var response = await crud.dataPost(AppLink.favDelete, {"id": favid});
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }

}
