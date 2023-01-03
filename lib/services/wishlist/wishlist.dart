// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:ecommerce/constants/api_endpoints.dart';
// import 'package:ecommerce/constants/api_url.dart';
// import 'package:ecommerce/model/wishlist/wishlist_model.dart';
// import 'package:ecommerce/utils/bazz_exception.dart';
// import 'package:ecommerce/utils/dio_interceptor.dart';

// class WishListServices {
//   Future<WishListModel?> getWishListItems() async {
//     final dios = await Interceptorapi().getApiUser();
//     try {
//       final Response response =
//           await dios.get(MainUrls.baseUrl + ApiEndPoints.wishList);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         log("get");
//         log(response.data);
//         final WishListModel model = WishListModel.fromJson(response.data);
//         return model;
//       }
//     } catch (e) {
//       BazzException.errorHandler(e);
//     }
//     return null;
//   }

//   Future<int?> addOrRemoveFromWishList(String productId) async {
//     final dios = await Interceptorapi().getApiUser();
//     try {
//       final Response response = await dios.post(
//         MainUrls.baseUrl + ApiEndPoints.wishList,
//         data: {'product': productId},
//       );
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         log("message");
//         return response.statusCode;
//       } else if (response.statusCode == 204) {
//         return response.statusCode;
//       }
//     } on DioError catch (e) {
//       log(e.message);
//       BazzException.errorHandler(e);
//     }
//     return null;
//   }
// }
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/wishlist/wishlist_model.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';

class WishlistServices {
  Future<WishListModel?> getWishListItems() async {
    final dio = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dio.get(MainUrls.baseUrl + ApiEndPoints.wishList);
      log(response.data.toString());
      if (response.statusCode == 200) {
        log('message');
        log(response.data.toString());
        final WishListModel model = WishListModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      log(e.toString());
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<int?> addOrRemoveFromWishList(String productId) async {
    final dio = await Interceptorapi().getApiUser();
    try {
      final Response response = await dio.post(
        MainUrls.baseUrl + ApiEndPoints.wishList,
        data: {'product': productId},
      );

      if (response.statusCode == 201) {
        return response.statusCode;
      } else if (response.statusCode == 204) {
        return response.statusCode;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }

    return null;
  }
}
