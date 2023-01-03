import 'dart:developer';

import 'package:ecommerce/model/cart/add_to_cart.dart';
import 'package:ecommerce/model/cart/get_from_cart_model.dart';
import 'package:ecommerce/model/order_summery/order_summery.dart';
import 'package:ecommerce/services/cart/cart_service.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController() {
    getCart();
  }
  int? sizeChartIndex;
  int quantity = 1;
  bool isLoading = false;
  List<String> cartItemsId = [];
  List<String> cartitemsPayId = [];
  CartModel? cartList;
  int? totalSave;

  void getCart() async {
    isLoading = true;
    notifyListeners();
    await CartService().getCart().then(
      (value) {
        if (value != null) {
          cartList = value;
          notifyListeners();

          log('get cart');
          cartItemsId = cartList!.products.map((e) => e.product.id).toList();
          totalSave = (cartList!.totalPrice - cartList!.totalDiscount).toInt();
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
        }
      },
    );
  }

  void addToCart(String productId, String? productSize,
      OrderSummaryScreenEnum? screencheck) async {
    isLoading = true;
    notifyListeners();
    log('addtocart');
    if (productSize == null) {
      BazzToast.showToast('Select Size', Colors.grey);
    } else {
      final AddToCartModel model = AddToCartModel(
        size: productSize.toString(),
        quantity: quantity,
        productId: productId,
      );
      await CartService().addToCart(model).then((value) {
        if (value != null) {
          getCart();
        }
        if (value == "product added to cart successfully") {
          log('addtocart');
          screencheck != OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen
              ? BazzToast.showToast("Product added to cart", Colors.grey)
              : null;
        } else {
          null;
        }
      });
    }
  }

  void removeFromCart(String productId) async {
    isLoading = true;
    notifyListeners();
    await CartService().removeFromCart(productId).then((value) {
      if (value != null) {
        getCart();
        BazzToast.showToast(
            'Product removed from cart Successfully', Colors.grey);
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        return;
      }
    });
  }
}
