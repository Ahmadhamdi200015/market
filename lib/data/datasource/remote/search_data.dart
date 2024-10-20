import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class SearchView {
  final Crud crud;

  SearchView(this.crud);

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