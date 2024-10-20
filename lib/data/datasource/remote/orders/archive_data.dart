import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class ArchiveData {
  final Crud crud;

  ArchiveData(this.crud);

  Future<dynamic> getArchive(String userid) async {
    var response = await crud.dataPost(AppLink.archiveOrder,{
      "id":userid.toString()
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> addRating(String orderid,int rating,String comment) async {
    var response = await crud.dataPost(AppLink.ratingOrder,{
      "id":orderid.toString(),
      "rating":rating.toString(),
      "comment":comment
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
}