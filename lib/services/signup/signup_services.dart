import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/signup_model/sign_up_model.dart';
import 'package:ecommerce/model/signup_model/sign_up_token_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:flutter/cupertino.dart';
import '../../constants/api_endpoints.dart';

class SignUpService {
  Dio dio = Dio();
  Future<SignUpTokenModel?> signUpService(
      SignUpModel model, BuildContext context) async {
    try {
      log('call');
      Response response = await dio.post(MainUrls.baseUrl + ApiEndPoints.signUp,
          data: json.encode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final SignUpTokenModel model = SignUpTokenModel.fromJson(response.data);
        return model;
        // return SignUpModel.fromJson(response.data);
      }
    } catch (e) {
      log("catch");
      // log(e.message);
      BazzException.errorHandler(e);
    }
    return null;
  }
}
