import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_queryparameters.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/login_model/login_arg_model.dart';
import 'package:ecommerce/model/login_model/login_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';

class SignInService {
  final dio = Dio();
  Future<LoginInArgModel?> login(LoginModel model) async {
    try {
      Response response = await dio.post(
        MainUrls.baseUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        final LoginInArgModel model = LoginInArgModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }
}
