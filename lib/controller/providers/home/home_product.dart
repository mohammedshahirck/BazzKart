import 'dart:developer';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/home/home_product.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

import '../../../view/detail_page/utils/product_id_model.dart';

class HomeProductController with ChangeNotifier {
  HomeProductController() {
    getProducts();
    sizeChartIndex = 0;
    notifyListeners();
  }
  int? sizeChartIndex;
  int selectedImage = 0;
  bool isLoading = false;
  List<ProductModel> productList = [];
  ProductModel? product;
  String? productId;
  String? productSize;

  void loadingStart() {
    isLoading = true;
    notifyListeners();
  }

  void toProductScreen(context, productId) {
    final args = ProductIdModel(productId: productId);
    Navigator.of(context).pushNamed(
      ProductDetailPage.routeNames,
      arguments: args,
    );
  }

  void goToCart(BuildContext context) {
    if (sizeChartIndex == null) {
      notifyListeners();
      BazzToast.showToast('Please select size', Colors.red);
    } else {
      log('going to cart');
      notifyListeners();
      Navigator.of(context).pushNamed(RouteNames.cartpage);
      notifyListeners();
    }
  }

  void getProducts() async {
    isLoading = true;
    notifyListeners();
    await HomeProduct().getHomeAllProducts().then(
      ((value) {
        if (value != null) {
          productList = value;
          notifyListeners();
          isLoading = false;
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      }),
    );
  }

  void sizeSelect(int index, String size) {
    sizeChartIndex = index;
    notifyListeners();
    productSize = size;
    notifyListeners();
  }

  ProductModel findById(String id) {
    return productList.firstWhere((element) => element.id == id);
  }

  List<ProductModel> findByCategory(String categoryid) {
    return productList.where((prod) {
      return prod.categoryId.contains(categoryid);
    }).toList();
  }

  void selectTap(int index) {
    selectedImage = index;
    notifyListeners();
  }
}
