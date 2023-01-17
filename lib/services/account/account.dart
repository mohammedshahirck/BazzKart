import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountService {
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
