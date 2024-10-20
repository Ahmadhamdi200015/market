import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class LoginData {
  final Crud crud;

  LoginData(this.crud);

  Future postData(String email, String password) async {

    // Construct the request payload
    var payload = {
      "email": email,
      "password": password,
    };

    // Make the POST request
    var response = await crud.dataPost(AppLink.login, payload);

    // Handle the response based on result type
    return response.fold(
            (l) => l, // Handle error
            (r) => r  // Handle success
    );

  }
}
