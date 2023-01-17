import 'package:ecommerce/model/order_summary.dart/order_summury.dart';

class OrderSummaryArguementModel {
  final String addressId;
  final OrderSummaryScreenEnum screenCheck;
  final String? productId;
  final String? cartId;
  OrderSummaryArguementModel({
    required this.addressId,
    required this.screenCheck,
    this.productId,
    this.cartId,
  });
}
