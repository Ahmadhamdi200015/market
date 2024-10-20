import 'package:flutterahmad/core/constant/route.dart';
import 'package:get/get.dart';

abstract class VerifiyCodePassword extends GetxController{
  GoToSuccessPassword();
}

class VerifiyCodePasswordImp extends VerifiyCodePassword{
   String? verificationCode;
  @override
  GoToSuccessPassword() {
      Get.offAllNamed(AppRoute.SuccessCheckPassword);

    // Get.offAllNamed(AppRoute.ResetPassword);
  }

}