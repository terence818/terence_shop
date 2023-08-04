import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terence_app/controller/auth_controller.dart';
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/controller/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'package:terence_app/pages/address/add_address_page.dart';
import 'package:terence_app/pages/auth/sign_in_page.dart';
import 'package:terence_app/pages/auth/sign_up_page.dart';
import 'package:terence_app/routes/route_helper.dart';
import 'package:terence_app/service/auth_service.dart';
import 'package:terence_app/utils/colors.dart';
import 'helper/dependencies.dart' as dep;

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  // await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          // set the initial rout
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
            fontFamily: "Lato",
          ),
          // home: AddAddressPage(),
          initialRoute: RouteHelper.getSignInPage(),
          getPages: RouteHelper.routes,
          // AuthService().handleAuthState()
        );
      });
    });
  }
}
