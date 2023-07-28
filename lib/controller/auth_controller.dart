import 'package:get/get.dart';
import 'package:terence_app/data/repository/auth_repo.dart';
import 'package:terence_app/models/response_model.dart';
import 'package:terence_app/models/signup_body_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    print("Getting token");
    print(authRepo.getUserToken().toString());
    authRepo.getUserToken();
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("Backend token");
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  
  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email,password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      print("My token is" + response.body['token']);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      
      responseModel = ResponseModel(true, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRepo.clearSharedData();
  }

}
