import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class FavouriteData {
  final Crud crud;

  FavouriteData(this.crud);

  Future<dynamic> AddFavourite(String userid, String itemsid) async {
    var response = await crud
        .dataPost(AppLink.addfav, {"userid": userid, "itemsid": itemsid});
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> RemoveFavourite(String userid, String itemsid) async {
    var response = await crud
        .dataPost(AppLink.removefav, {"userid": userid, "itemsid": itemsid});
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }
}
