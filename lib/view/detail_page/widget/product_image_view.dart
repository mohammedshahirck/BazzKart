import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
    required this.loadProduct,
  }) : super(key: key);

  final ProductModel loadProduct;

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProductController, WishlistProvider>(
        builder: (context, value1, value2, _) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .55,
        color: const Color.fromARGB(255, 233, 231, 231).withOpacity(1),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Ksize.ksize10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ksize.kWsize30,
                  Image.network(
                    "http://${MainUrls.url}/products/${loadProduct.image[value1.selectedImage]}",
                    height: MediaQuery.of(context).size.height * .38,
                  ),
                ],
              ),
              Ksize.ksize10,
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 11),
                child: Row(
                  children: [
                    ...List.generate(
                      loadProduct.image.length,
                      (index) => Consumer<HomeProductController>(
                          builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () => value.selectTap(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 2000),
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.all(8),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(
                                      value.selectedImage == index ? 1 : 0)),
                            ),
                            child: Image.network(
                              "http://${MainUrls.url}/products/${loadProduct.image[index]}",
                              height: 100,
                              width: 100,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
