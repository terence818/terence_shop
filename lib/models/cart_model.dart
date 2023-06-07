class CartModel {
  late int id;
  late String name;
  late double price;
  late String img;
  late int quantity;
  late bool isExist;
  late String time;

  CartModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.img,
      required this.quantity,
      required this.isExist,
      required this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    price = (json['price'] ?? 0).toDouble();
    img = json['img'] ?? '';
    quantity =json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }

 
}
