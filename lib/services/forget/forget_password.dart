import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_queryparameters.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/signup_model/sign_up_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';

class ForgetPasswordservice {
  Dio dio = Dio();
  Future<SignUpModel?> userCheck(email) async {
    try {
      log('enterd to getuser fun');
      Response response = await dio.get(
        MainUrls.baseUrl + ApiEndPoints.userVerify,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        log('got user');
        final SignUpModel model = SignUpModel.fromJson(response.data);
        return model;
      } else if (response.statusCode == 201) {
        return null;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<String?> forgetPassword(email, newpassword) async {
    try {
      Response response = await dio.post(
        MainUrls.baseUrl + ApiEndPoints.forgetPassword,
        data: {
          'email': email,
          'password': newpassword,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      if (response.statusCode == 202) {
        return response.data['message'];
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }
}
