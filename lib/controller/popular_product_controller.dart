import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/data/repository/popular_product_repo.dart';
import 'package:terence_app/models/cart_model.dart';
import 'package:terence_app/models/products_model.dart';
import 'package:terence_app/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

Future<void> getPopularProductList() async {
  Response response = await popularProductRepo.getPopularProductList();
  if (response.statusCode == 200) {
    try {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();

      // Call the function to fetch product images
      // await fetchProductImages();
    } catch (exception) {
      print('Error retrieving product images: $exception');
      // Handle the error appropriately (e.g., show an error message)
    }
  } else {
    // Handle the response status code that is not 200 appropriately
  }
}

 Future<void> fetchProductImages() async {
  for (ProductModel product in _popularProductList) {
    String imageUrl = product.img;
    try {
      // Make the image URL request and handle the response
      http.Response imageResponse = await http.get(Uri.parse(imageUrl));
      if (imageResponse.statusCode == 200) {
        // Image retrieval successful
        // Process the image or store it as needed
      } else {
        // Image retrieval failed, handle the error appropriately
      }
    } catch (e) {
      print('Error retrieving image: $e');
      // Handle the error appropriately (e.g., show an error message)
    }
  }
}

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
       if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
       }   
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar("Item count", "You can't add more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("the quantity in the cart is$_inCartItems");

    //if exist
    //get from storage _inCartItems=3
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The id is ${value.id}The quantity is${value.quantity}");
    });
    // } else {
    //   Get.snackbar("Add Cart", "You should at least add an item in the cart!",
    //       backgroundColor: AppColors.mainColor, colorText: Colors.white);
    // }

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
