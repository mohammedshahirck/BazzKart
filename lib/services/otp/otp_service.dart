import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_queryparameters.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/utils/bazz_exception.dart';

class OtpServices {
  Dio dio = Dio();
  Future<String?> verifyOtp(email, otpNumber) async {
    try {
      log('verifyOtp');
      Response response = await dio.post(
        MainUrls.baseUrl + ApiEndPoints.verifySendotp,
        data: {
          'otp': otpNumber,
          'email': email,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<String?> sendOtp(email) async {
    try {
      log('sendOtp');
      Response response = await dio.get(
        MainUrls.baseUrl + ApiEndPoints.verifySendotp,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['message'];
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }
}
