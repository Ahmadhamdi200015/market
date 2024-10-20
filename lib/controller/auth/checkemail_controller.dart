import 'package:flutterahmad/core/constant/route.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController{
  GoToSuccessPage();
}
class CheckemailControllerImp extends CheckEmailController{
  @override
  GoToSuccessPage() {
    Get.offAllNamed(AppRoute.SuccessCheckPassword);
  }

}