import 'package:get/get.dart';
import 'package:terence_app/data/repository/popular_product_repo.dart';
import 'package:terence_app/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=> _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200) {
      print("got product");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {
      print("failed: ${response.body}");
    }
  }

}