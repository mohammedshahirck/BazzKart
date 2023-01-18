import 'dart:developer';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController with ChangeNotifier {
  Razorpay razorpay = Razorpay();
  void openCheckout(price) async {
    var options = {
      'key': 'rzp_test_f3ptUUWgl2JIzH',
      'amount': price * 100,
      'name': 'Bazz Kart',
      'description': 'Payment',
      'prefill': {'contact': '7656874575', 'email': 'mohammedshahir@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
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
}
