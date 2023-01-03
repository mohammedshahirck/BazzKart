// import 'dart:developer';

// import 'package:ecommerce/model/wishlist/wishlist_model.dart';
// import 'package:ecommerce/services/wishlist/wishlist.dart';
// import 'package:ecommerce/utils/api_base_url.dart';
// import 'package:flutter/material.dart';

// class WishlistController with ChangeNotifier {
//   WishlistController() {
//     getWishlistItems();
//   }
//   bool isLoadding = false;
//   WishListModel? wishlist;
//   List wishListProducts = [];

//   void startloading() {
//     isLoadding = true;
//     notifyListeners();
//   }

//   void getWishlistItems() async {
//     isLoadding = true;
//     notifyListeners();
//     await WishlistServices().getWishListItems().then((value) {
//       if (value != null) {
//         wishlist = value;
//         notifyListeners();
//         wishListProducts = wishlist!.products.map((e) => e.product.id).toList();
//         notifyListeners();

//         log("ok");
//       } else {
//         log("error");
//         isLoadding = false;
//         notifyListeners();
//       }
//     });
//   }

//   void addOrRemoveFromWishList(String productID) async {
//     isLoadding = true;
//     notifyListeners();
//     await WishlistServices().addOrRemoveFromWishList(productID).then((value) {
//       if (value != null) {
//         WishlistServices().getWishListItems().then((value) {
//           if (value != null) {
//             wishlist = value;
//             notifyListeners();
//             getWishlistItems();
//             isLoadding = false;
//             notifyListeners();
//           } else {
//             isLoadding = false;
//             notifyListeners();
//           }
//         });
//         if (value == 201) {
//           BazzToast.showToast('Item added to Wishlist', Colors.green);
//         } else if (value == 204) {
//           BazzToast.showToast('Item removed from Wishlist', Colors.grey);
//         }
//       } else {
//         isLoadding = false;
//         notifyListeners();
//       }
//     });
//   }
// }

import 'package:ecommerce/services/wishlist/wishlist.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:flutter/material.dart';

import '../../../model/wishlist/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  WishlistProvider() {
    startLoading();
  }

  bool isLoading = false;
  WishListModel? wishList;
  List<dynamic> favorProduct = [];

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void getWishListItems() async {
    isLoading = true;
    notifyListeners();
    await WishlistServices().getWishListItems().then(
      (value) {
        if (value != null) {
          wishList = value;
          notifyListeners();
          isLoading = false;
          favorProduct = wishList!.products.map((e) => e.product.id).toList();
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
  }

  void addRemoveWishlistItem(String productID) async {
    isLoading = true;
    notifyListeners();
    await WishlistServices().addOrRemoveFromWishList(productID).then(
      (value) {
        if (value != null) {
          WishlistServices().getWishListItems().then((value) {
            if (value != null) {
              wishList = value;
              notifyListeners();
              getWishListItems();
              isLoading = false;
              notifyListeners();
            } else {
              isLoading = false;
              notifyListeners();
            }
          });

          if (value == 201) {
            BazzToast.showToast("Item Added to Wishlist", Colors.green);
          } else if (value == 204) {
            BazzToast.showToast("Item Removed from Wishlist", Colors.green);
          }
        } else {
          isLoading = false;
          notifyListeners();
        }
      },
    );
  }
}
