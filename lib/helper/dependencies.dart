import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:terence_app/data/repository/popular_product_repo.dart';


Future<void> init()async {

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
    Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}