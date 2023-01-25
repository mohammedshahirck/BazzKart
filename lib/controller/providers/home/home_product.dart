import 'package:ecommerce/controller/providers/bottom_nav/bottom_nav.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/services/home/home_product.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/view/my_bag/my_bag.dart';
import 'package:ecommerce/view/order_page/order_page.dart';
import 'package:ecommerce/widgets/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void sizechart0() {
    sizeChartIndex = 0;
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
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => BottomNav(),
          ),
          (route) => false);
      Provider.of<BottomNavController>(context, listen: false).index = 1;
      notifyListeners();
    }
  }

  void gotoOrderpage(
      String productId, BuildContext context, String? productSize) {
    if (productSize == null) {
      BazzToast.showToast('Select Size', Colors.grey);
    } else {
      Navigator.of(context).pushNamed(
        OrderPage.routename,
        arguments: productId,
      );

      notifyListeners();
    }
  }

  void goToCartpage(BuildContext context) {}

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
      return prod.category.contains(categoryid);
    }).toList();
  }

  void selectTap(int index) {
    selectedImage = index;
    notifyListeners();
  }
}
