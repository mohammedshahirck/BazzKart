import 'package:ecommerce/model/home/carousal_model.dart';
import 'package:ecommerce/model/home/category_model.dart';
import 'package:ecommerce/services/home/home_services.dart';
import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getCategories();
    getCarousals();
  }
  List<CategoryModel> categoryList = [];
  List<CarousalModel> carousalList = [];
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
}
