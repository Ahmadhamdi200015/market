import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class   CategoriesData {
  final Crud crud;

  CategoriesData(this.crud);

  Future<dynamic> getData() async {
    var response = await crud.dataPost(AppLink.Homeview,{});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
}