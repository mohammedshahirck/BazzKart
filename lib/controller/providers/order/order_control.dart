import 'package:ecommerce/model/cart/get_single.dart';
import 'package:ecommerce/model/order_summery/order_summery.dart';
import 'package:ecommerce/services/cart/cart_service.dart';
import 'package:ecommerce/view/order_page/order_page.dart';
import 'package:flutter/cupertino.dart';

class OrderSummaryProvider with ChangeNotifier {
  OrderSummaryProvider() {
    startLoading();
  }

  bool loading = false;
  List<GetSingelCartProduct> product = [];
  int? totalSave;
  List<String> productIds = [];

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void toOderScreen(context, productId, cartId) {
    getSingleCartProduct(
      context,
      productId,
      cartId,
    );
    notifyListeners();
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) {
        return OrderPage(
          screenEnumcheck:
              OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen,
          cartId: cartId,
          productId: productId,
        );
      },
    ));
    notifyListeners();
  }

  Future<void> getSingleCartProduct(
      context, String productId, String cartId) async {
    await CartService().getSingleCart(context, productId, cartId).then((value) {
      loading = true;
      notifyListeners();
      if (value != null) {
        product = value;
        notifyListeners();
        totalSave = product[0].discountPrice.toInt() - product[0].price.toInt();
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
