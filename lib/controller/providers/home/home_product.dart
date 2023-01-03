import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/home/home_product.dart';
import 'package:flutter/cupertino.dart';

class HomeProductController with ChangeNotifier {
  HomeProductController() {
    getProducts();
  }
  int? sizeChartIndex;
  bool isLoading = false;
  List<ProductModel> productList = [];
  ProductModel? product;
  String? productId;
  String? productSize;

  void loadingStart() {
    isLoading = true;
    notifyListeners();
  }

  void goToCart(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.cartpage);
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

  void sizeSelect(int index) {
    sizeChartIndex = index;
    notifyListeners();
    productSize = product?.size[index].toString();
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
}
