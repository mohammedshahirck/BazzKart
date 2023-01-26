import 'dart:developer';
import 'package:ecommerce/model/orders/place_order_model.dart';
import 'package:ecommerce/services/order/order_argument_model.dart';
import 'package:ecommerce/services/order/order_service.dart';
import 'package:ecommerce/services/razor_pay_service/razor_pay_service.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:ecommerce/view/order%20_page/order_page.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController with ChangeNotifier {
  bool isloading = false;
  Razorpay razorpay = Razorpay();
  Map<String, dynamic> options = {};
  void openCheckout(price, context) async {
    options = {
      'key': 'rzp_test_f3ptUUWgl2JIzH',
      'amount': price * 100,
      'name': 'Bazz Kart',
      'description': 'Payment',
      'prefill': {'contact': '7656874575', 'email': 'mohammedshahir@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    notifyListeners();
    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderDetails(),
            ));
        BazzToast.showToast(
            'Payment Success${response.paymentId}', Colors.grey);
      });
      notifyListeners();
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  void order(context) async {
    RazorPayService().openRazorPay(razorpay, options);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    BazzToast.showToast("SUCCESS:${response.paymentId}", Colors.grey);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    BazzToast.showToast("${response.code}-${response.message}", Colors.grey);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    BazzToast.showToast(' ${response.walletName}', Colors.grey);
  }

  Future<void> orderProducts(
      String addressId, paymentType, products, context) async {
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
        final OrderPlacedScreenArguementModel args =
            OrderPlacedScreenArguementModel(orderId: value);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OrderDetails(
                args: args,
              );
            },
          ),
        );
      } else {
        isloading = false;
        notifyListeners();
      }
    });
  }
}
