import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayService {
  void openRazorPay(Razorpay razorPay, options) {
    try {
      razorPay.open(options);
    } catch (e) {
      BazzException.errorHandler(e);
    }
  }
}
