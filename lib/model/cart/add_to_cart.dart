class AddToCartModel {
  final String size;
  final dynamic quantity;
  final String productId;

  AddToCartModel({
    required this.size,
    required this.quantity,
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': productId,
      'qty': quantity,
      'size': size,
    };
  }
}
