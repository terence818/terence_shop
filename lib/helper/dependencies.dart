import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/controller/recommended_product_controller.dart';
import 'package:terence_app/data/api/api_client.dart';
import 'package:terence_app/data/repository/cart_repo.dart';
import 'package:terence_app/data/repository/popular_product_repo.dart';
import 'package:terence_app/data/repository/recommended_product_repo.dart';
import 'package:terence_app/utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();


  Get.lazyPut(() => sharedPreferences);
  //api client
  //http://192.168.100.21:8000
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));


  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  //  Get.lazyPut(() => CartController(cartRepo: Get.find(), permanent: true));
}
