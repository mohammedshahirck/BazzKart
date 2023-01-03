import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeNames = "/detail_page";
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadProduct =
        Provider.of<HomeProductController>(context, listen: false)
            .findById(productId);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 233, 231, 231).withOpacity(1),
        body:
            Consumer3<HomeProductController, WishlistProvider, CartController>(
                builder: (context, value, value2, value3, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .58,
                  color:
                      const Color.fromARGB(255, 233, 231, 231).withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => value2.addRemoveWishlistItem(
                                    loadProduct.id,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      value2.favorProduct
                                              .contains(loadProduct.id)
                                          ? Icons.favorite
                                          : Icons.favorite_outline_outlined,
                                      color: value2.favorProduct
                                              .contains(loadProduct.id)
                                          ? Colors.red
                                          : Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Ksize.ksize20,
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.share_outlined),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Image.network(
                          "http://${MainUrls.url}/products/${loadProduct.image[0]}",
                          height: 320,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          loadProduct.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Ksize.ksize10,
                        Row(
                          children: [
                            Text("₹${loadProduct.discountPrice}"),
                            Ksize.kWsize10,
                            Text(
                              "₹${loadProduct.price.toString()}",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Ksize.kWsize10,
                            Text(
                              "${loadProduct.offer}% off",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Ksize.ksize10,
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(loadProduct.rating),
                          ],
                        ),
                        Ksize.ksize20,
                      ],
                    ),
                  ),
                ),
                Ksize.ksize10,
                Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Select Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...List.generate(
                                loadProduct.size.length,
                                (index) => GestureDetector(
                                      onTap: () => value.sizeSelect(index),
                                      child: Card(
                                          elevation: 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: value.sizeChartIndex ==
                                                          index
                                                      ? Colors.blue
                                                      : Colors.white),
                                            ),
                                            height: 30,
                                            width: 30,
                                            child: Center(
                                                child: Text(
                                              loadProduct.size[index],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          )),
                                    )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Ksize.ksize10,
              ],
            ),
          );
        }),
        bottomNavigationBar: Consumer2<HomeProductController, CartController>(
            builder: (context, value, value2, child) {
          return Card(
            elevation: 5,
            child: Container(
              color: Colors.white,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomElevateButton(
                      size: 16,
                      text: 'ADD TO CART',
                      onpressed: () {
                        value2.addToCart(
                          loadProduct.id,
                          value.productSize,
                          null,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
