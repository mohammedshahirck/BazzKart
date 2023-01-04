import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/cart/add_to_cart.dart';
import 'package:ecommerce/model/cart/get_from_cart_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';

class CartService {
  Future<String?> addToCart(AddToCartModel model) async {
    Dio dios = await Interceptorapi().getApiUser();

    try {
      final Response response = await dios.post(
        MainUrls.baseUrl + ApiEndPoints.cart,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final cartResponse = response.data['message'];
        return cartResponse;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<CartModel?> getCartModelItems() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(MainUrls.baseUrl + ApiEndPoints.cart);
      if (response.statusCode == 200) {
        final CartModel model = CartModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<CartModel?> getCart() async {
    Dio dio = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dio.get(MainUrls.baseUrl + ApiEndPoints.cart);
      if (response.data == null) {
        return null;
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        final CartModel model = CartModel.fromJson(response.data);
        log(response.data.toString());
        return model;
      }
    } on DioError catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<String?> removeFromCart(String id) async {
    Dio dio = await Interceptorapi().getApiUser();
    try {
      final Response response = await dio.patch(
        MainUrls.baseUrl + ApiEndPoints.cart,
        data: {
          "product": id,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final remove = response.data['message'];
        return remove;
      }
    } on DioError catch (e) {
      log(e.message);
      BazzException.errorHandler(e);
    }
    return null;
  }
}
