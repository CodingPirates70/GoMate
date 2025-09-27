import 'package:gomate/constants/api_const.dart';
import 'package:gomate/models/user_model.dart';
import 'package:gomate/services/api_services.dart';

class UserService {
  final ApiService _apiService = ApiService();

  Future<UserModel> register({
    required String email,
    required String password,
    required String userName,
  }) async {
    final response = await _apiService.post(
      baseUrl: ApiConstants.baseUrl,
      path: ApiConstants.registerUser,
      body: {
        "email": email,
        "password": password,
        "userName": userName,
      },
      isHttps: true,
    );

    return UserModel.fromJson(response);
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(
      baseUrl: ApiConstants.baseUrl,
      path: ApiConstants.loginUser,
      body: {
        "email": email,
        "password": password,
      },
      isHttps: true,
    );

    return UserModel.fromJson(response);
  }
}
