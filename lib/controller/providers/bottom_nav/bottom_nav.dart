import 'package:ecommerce/view/profile/profile.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:ecommerce/view/my_bag/my_bag.dart';
import 'package:ecommerce/view/wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';

class BottomNavController extends ChangeNotifier {
  int index = 0;
  final List<Widget> screens = [
    const HomePage(),
    const MyBag(),
    const Favorites(),
    const Account(),
  ];

  List<Widget> get screen => screens;
  void bottomIndex(int bottomIndex) {
    index = bottomIndex;
    notifyListeners();
  }

  void gotoHomescreen() {
    index = 0;
    notifyListeners();
  }
}
