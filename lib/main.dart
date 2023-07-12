import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terence_app/controller/auth_controller.dart';
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/controller/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'package:terence_app/routes/route_helper.dart';
import 'package:terence_app/service/auth_service.dart';
import 'helper/dependencies.dart' as dep;

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  // await Firebase.initializeApp().then((value) => Get.put(AuthController()));
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
            primarySwatch: Colors.pink,
          ),
          // home: AuthService().handleAuthState(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          // AuthService().handleAuthState()
        );
      });
    });
  }
}
