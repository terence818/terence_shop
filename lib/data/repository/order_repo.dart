import 'package:terence_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:terence_app/models/place_order_model.dart';
import 'package:terence_app/utils/app_constants.dart';

class OrderRepo {
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderBody placeOrder) async{
    return await apiClient.postData(AppConstants.PLACE_ORDER_URL, placeOrder.toJson());
  }



}
