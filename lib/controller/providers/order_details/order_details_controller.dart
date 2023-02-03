import 'package:ecommerce/model/orders/get_all_order_model.dart';
import 'package:ecommerce/services/order/order_service%20copy.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider() {
    getAllOrders();
  }
  List<GetOrderModel>? ordersList = [];
  bool loading = false;
  GetOrderModel? singleModel;
  String? deliveryDate;

  void getAllOrders() async {
    await OrderServices().getAllOrders().then((value) {
      if (value != null) {
        ordersList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> cancelOrder(String orderId) async {
    loading = true;
    notifyListeners();

    await OrderServices().cancelOrder(orderId).then((value) {
      if (value != null) {
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void getSingleOrder(String orderId) async {
    await OrderServices().getSingleOrder(orderId).then((value) {
      if (value != null) {
        singleModel = value;
        notifyListeners();
        deliveryDate = formatDate(singleModel!.deliveryDate.toString());
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void sendOrderDetials(context) {
    Share.share(
        "ShoeCart Order -Order Id:${singleModel!.id},Total Products:${singleModel!.products.length},Total Price:${singleModel!.totalPrice},Delivery Date:$deliveryDate");
  }

  String? formatDate(String date) {
    final a = date.split(' ');
    return a[0];
  }

  String? formatCancelDate(String? date) {
    if (date != null) {
      final a = date.split('T');
      return a[0];
    } else {
      return null;
    }
  }
}
