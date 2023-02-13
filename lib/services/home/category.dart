import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/home/category_model.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';

class CategoryServices {
  Future<List<CategoryModel>?> getCategories() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(MainUrls.baseUrl + ApiEndPoints.categories);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CategoryModel> category = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return category;
      }
    } on DioError catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductModel>?> getProductByCategory(String categoryID) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
          '${MainUrls.baseUrl + ApiEndPoints.product}?category=$categoryID');
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
