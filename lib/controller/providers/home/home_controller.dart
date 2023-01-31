import 'package:ecommerce/model/home/carousal_model.dart';
import 'package:ecommerce/model/home/category_model.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/services/home/home_services.dart';
import 'package:ecommerce/utils/debouncer.dart';
import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getCategories();
    getCarousals();
  }
  List<CategoryModel> categoryList = [];
  List<CarousalModel> carousalList = [];
  List<ProductModel> productList = [];
  final debouncer = Debouncer(milliseconds: 200);
  int activeindex = 0;
  void carosoul(index) {
    activeindex = index;
    notifyListeners();
  }

  bool isLoading = false;
  void getCategories() async {
    isLoading = true;
    notifyListeners();
    await HomeServices().getHomeCategories().then((value) {
      if (value != null) {
        categoryList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void getCarousals() async {
    isLoading = true;
    notifyListeners();
    await HomeServices().getCarousals().then((value) {
      if (value != null) {
        carousalList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    });
  }

  Future<void> searchProducts(String text) async {
    isLoading = true;
    notifyListeners();
    await HomeServices().searchProducts(text).then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  CategoryModel categoryName(String id) {
    return categoryList.firstWhere((element) => element.id == id);
  }
}
