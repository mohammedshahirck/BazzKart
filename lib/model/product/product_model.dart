class ProductModel {
  String id;
  String name;
  int price;
  dynamic discountPrice;
  int offer;
  List<String> size;
  List<String> image;
  String categoryId;
  String rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.offer,
    required this.size,
    required this.image,
    required this.categoryId,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      offer: json['offer'],
      image: List<String>.from(
        json['image'].map((x) => x),
      ),
      size: List<String>.from(
        json['size'].map((x) => x),
      ),
      categoryId: json['category'],
      rating: json['rating'],
    );
  }
}
