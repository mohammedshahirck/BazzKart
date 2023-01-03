import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';

class HomeProduct {
  Future<List<ProductModel>?> getHomeAllProducts() async {
    Dio dio = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dio.get(MainUrls.baseUrl + ApiEndPoints.product);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ProductModel> products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return products;
      }
    } on DioError catch (e) {
      log(e.message);
      BazzException.errorHandler(e);
    }
    return null;
  }
}
