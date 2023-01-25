import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.ffem,
    required this.fem,
  }) : super(key: key);

  final double ffem;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProductController, WishlistProvider>(
        builder: (context, values, values2, child) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCard(
                ffem: ffem,
                fem: fem,
                image:
                    "http://${MainUrls.url}/products/${values.productList[index].image[0]}",
                name: values.productList[index].name,
                offer: "${values.productList[index].offer}% off",
                price:
                    "₹${(((values.productList[index].price - values.productList[index].discountPrice).round()).toString())}",
                rating: values.productList[index].rating,
                argument: values.productList[index].id,
              );
            },
            itemCount: values.productList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
      );
    });
  }
}
