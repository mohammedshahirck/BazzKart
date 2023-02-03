import 'dart:developer';
import 'package:ecommerce/model/orders/place_order_model.dart';
import 'package:ecommerce/services/order/order_service.dart';
import 'package:ecommerce/view/order_page/widget/order_product.dart';
import 'package:ecommerce/widgets/navigation_class.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController with ChangeNotifier {
  bool isloading = false;
  Razorpay razorpay = Razorpay();
  String? addressId;
  List<Product> products = [];
  Map<String, dynamic> options = {};
  void setAddressId(String addressid) {
    addressId = addressid;
    notifyListeners();
  }

  void setTotalAmount(amount, List<String> productIds, address) {
    final total = "${amount * 100}";
    final amountPayable = total.toString();
    openCheckout(amountPayable);
    products = productIds.map((e) => Product(id: e)).toList();
    addressId = address;
    notifyListeners();
  }

  void openCheckout(price) async {
    options = {
      'key': 'rzp_test_f3ptUUWgl2JIzH',
      'amount': price,
      'name': 'Bazz Kart',
      'description': 'Payment',
      'prefill': {'contact': '7656874575', 'email': 'mohammedshahir@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);

      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  // void order(context) async {
  //   RazorPayService().openRazorPay(razorpay, options);
  // }

  // void handlePaymentSuccess(PaymentSuccessResponse response) {
  //   BazzToast.showToast("SUCCESS:${response.paymentId}", Colors.grey);
  // }

  // void handlePaymentError(PaymentFailureResponse response) {
  //   BazzToast.showToast("${response.code}-${response.message}", Colors.grey);
  // }

  // void handleExternalWallet(ExternalWalletResponse response) {
  //   BazzToast.showToast(' ${response.walletName}', Colors.grey);
  // }
  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS:${response.paymentId}", timeInSecForIosWeb: 4);
    orderProducts(addressId!, 'ONLINE_PAYMENT');
    notifyListeners();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR:${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
    notifyListeners();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:${response.walletName}", timeInSecForIosWeb: 4);
    notifyListeners();
  }

  Future<void> orderProducts(
    String addressId,
    paymentType,
  ) async {
    isloading = true;
    notifyListeners();
    final PlaceOrderModel model = PlaceOrderModel(
      addressId: addressId,
      paymentType: paymentType,
      products: products,
    );
    await OrderServices().placeOrder(model).then((value) {
      if (value != null) {
        isloading = false;
        notifyListeners();
      } else {
        isloading = false;
        notifyListeners();
      }
    });
  }
}
