import 'dart:developer';

import 'package:ecommerce/model/cart/add_to_cart.dart';
import 'package:ecommerce/model/cart/get_from_cart_model.dart';
import 'package:ecommerce/model/order_summery/order_summery.dart';
import 'package:ecommerce/services/cart/cart_service.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController() {
    startLoading();
    getCart();
  }
  int? sizeChartIndex;
  int quantity = 1;
  bool isLoading = false;
  List<String> cartItemsId = [];
  List<String> cartitemsPayId = [];
  CartModel? cartList;
  int? totalSave;
  int? totalProductCount;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void getCart() async {
    isLoading = true;
    notifyListeners();
    await CartService().getCart().then(
      (value) {
        if (value != null) {
          cartList = value;
          notifyListeners();
          cartItemsId = cartList!.products.map((e) => e.product.id).toList();
          cartitemsPayId = cartList!.products.map((e) => e.id).toList();
          totalSave =
              (cartList!.totalPrice.toInt() - cartList!.totalDiscount).toInt();
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

  Future<void> addToCart(String productId, String? productSize,
      OrderSummaryScreenEnum? screencheck) async {
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

          if (value == "product added to cart successfully") {
            log('addtocart');
            screencheck !=
                    OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen
                ? BazzToast.showToast(
                    "Product added to cart",
                    Colors.grey,
                  )
                : null;
          } else {
            null;
          }
        } else {
          null;
        }
      });
    }
  }

  void totalProduct() {
    dynamic count = 0;
    for (var i = 0; i < cartList!.products.length; i++) {
      count = count + cartList!.products[i].qty;
    }
    totalProductCount = count;
    notifyListeners();
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

  Future<void> incrementOrDecrementQuantity(int qty, String productId,
      String productSize, int productquantity) async {
    final AddToCartModel addToCartModel = AddToCartModel(
      productId: productId,
      quantity: qty,
      size: productSize.toString(),
    );
    if (qty == 1 && productquantity >= 1 || qty == -1 && productquantity > 1) {
      await CartService().addToCart(addToCartModel).then((value) async {
        if (value != null) {
          await CartService().getCart().then((value) {
            if (value != null) {
              cartList = value;
              notifyListeners();
              totalProduct();
              notifyListeners();
            } else {
              null;
            }
          });
        } else {
          null;
        }
      });
    } else {
      null;
    }
  }
}
