import 'package:flutterahmad/applink.dart';
import 'package:flutterahmad/core/class/crud.dart';

class SignupData {
  final Crud crud;

  SignupData(this.crud);

  Future postData(String username, String password, String email, String phone) async {

      // Construct the request payload
      var payload = {
        "username": username,
        "password": password,
        "email": email,
        "phone": phone
      };

      // Make the POST request
      var response = await crud.dataPost(AppLink.signup, payload);

      // Handle the response based on result type
      return response.fold(
              (l) => l, // Handle error
              (r) => r  // Handle success
      );

  }
}
