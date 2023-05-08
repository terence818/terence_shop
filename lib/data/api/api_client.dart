import 'package:get/get.dart';
import 'package:terence_app/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 60);
    token = AppConstants.TOKEN; // replace with your actual token value
    _mainHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async{
    try{
      
      Response response = await get(uri);
      // print(response);
      return response;

    }catch(e) {
      await Future.delayed(Duration(seconds: 2));
      return Response(statusCode: 1,statusText: e.toString());
      
    }
  }
}