import 'package:get/get.dart';
import 'package:terence_app/food/popular_food_detail.dart';
import 'package:terence_app/food/recommended_food_detail.dart';
import 'package:terence_app/home/main_food_page.dart';
import 'package:terence_app/home_page.dart';

class RouteHelper {
  static const String initial="/home-page";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';


  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name:popularFood, page: (){
      var pageId=Get.parameters['pageId'];

      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),
     GetPage(name:recommendedFood, page: (){
       var pageId=Get.parameters['pageId'];

      return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),
  ];
}