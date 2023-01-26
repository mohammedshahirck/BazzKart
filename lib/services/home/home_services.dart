import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/home/carousal_model.dart';
import 'package:ecommerce/model/home/category_model.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';

class HomeServices {
  Future<List<CategoryModel>?> getHomeCategories() async {
    Dio dio = await Interceptorapi().getApiUser();
    try {
      log('homeser');
      final Response response =
          await dio.get(MainUrls.baseUrl + ApiEndPoints.categories);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        final List<CategoryModel> categories = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        log('jii');
        log(categories[0].image);
        return categories;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<List<CarousalModel>?> getCarousals() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
        MainUrls.baseUrl + ApiEndPoints.carousal,
      );
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CarousalModel> carousals = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousals;
      } else {
        return null;
      }
    } catch (e) {
      log('entered catch');
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductModel>?> searchProducts(String searchValue) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
          MainUrls.baseUrl + ApiEndPoints.product,
          queryParameters: {"search": searchValue});
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ProductModel> products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();

        return products;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }
}
