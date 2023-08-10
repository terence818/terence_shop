import 'package:get/get.dart';
import 'package:terence_app/base/show_custom_nackbar.dart';
import 'package:terence_app/routes/route_helper.dart';

class ApiChecker {
  static void checkApi(Response response){
    if(response.statusCode==401){
        Get.offNamed(RouteHelper.getSignInPage());
    } else {
      showCustomSnackBar(response.statusText!);
    }
  }
}