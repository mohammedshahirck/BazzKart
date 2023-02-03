import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/user_model/user_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountService {
  Future<UserModel?> getUserDetails(String email) async {
    Dio dio = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dio.get(MainUrls.baseUrl + ApiEndPoints.user + email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final UserModel userModel = UserModel.fromJson(response.data);
        return userModel;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<String?> logOutUser() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final token = storage.read(key: 'token');
      final refreshToken = storage.read(key: 'refreshToken');
      dios.options.headers["authorization"] = "Bearer $token";
      dios.options.headers["refresh"] = "$refreshToken";
      final Response response =
          await dios.get(MainUrls.baseUrl + ApiEndPoints.logout);

      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }
}
