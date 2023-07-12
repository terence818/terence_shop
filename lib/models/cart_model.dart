import 'package:terence_app/models/products_model.dart';

class CartModel {
  late int id;
  late String name;
  late double price;
  late String img;
  late int quantity;
  late bool isExist;
  late String time;
  ProductModel? product;

  CartModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.img,
      required this.quantity,
      required this.isExist,
      required this.time,
      required this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    price = (json['price'] ?? 0).toDouble();
    img = json['img'] ?? '';
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product":this.product!.toJson(),
    };
  }
}
