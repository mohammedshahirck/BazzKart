import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/address/address_screen.dart';
import 'package:ecommerce/view/order_page/order_page.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_style.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeNames = "/detail_page";
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadProduct =
        Provider.of<HomeProductController>(context, listen: false)
            .findById(productId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProductController>(context, listen: false).sizechart0();
    });

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
                  height: MediaQuery.of(context).size.height * .65,
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
                                // CircleAvatar(
                                //   backgroundColor: Colors.white,
                                //   child: RawMaterialButton(
                                //     elevation: 10,
                                //     onPressed: () {},
                                //     child: const Icon(Icons.share_outlined),
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                        Image.network(
                          "http://${MainUrls.url}/products/${loadProduct.image[value.selectedImage]}",
                          height: 320,
                        ),
                        Ksize.ksize10,
                        Padding(
                          padding: const EdgeInsets.all(11),
                          child: Row(
                            children: [
                              ...List.generate(
                                loadProduct.image.length,
                                (index) => Consumer<HomeProductController>(
                                    builder: (context, value, child) {
                                  return GestureDetector(
                                    onTap: () => value.selectTap(index),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(8),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(
                                                value.selectedImage == index
                                                    ? 1
                                                    : 0)),
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
                            Text(
                                "₹${(loadProduct.price) - (loadProduct.discountPrice)}"),
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
                      ],
                    ),
                  ),
                ),
                Ksize.ksize5,
                Container(
                  color: Colors.white,
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
                                    onTap: () => value.sizeSelect(
                                        index, loadProduct.size[index]),
                                    child: Card(
                                        elevation: 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: value.sizeChartIndex ==
                                                        index
                                                    ? Colors.black
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
                Ksize.ksize5,
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Details',
                          style: SafeGoogleFont(
                            'Metropolis',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.2575,
                            color: Colors.black,
                            // const Color(0xff222222),
                          ),
                        ),
                        Ksize.ksize10,
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'An ideal pick for a casual wardrobe, this casual shirt is designed with a solid surface, spread collar and a patch pocket.',
                          ),
                        ),
                        Ksize.ksize10,
                        const OverViewDetails(
                          data: 'Formal',
                          title: 'Type',
                        ),
                        Ksize.ksize10,
                        const OverViewDetails(title: 'Design', data: 'Solid'),
                        Ksize.ksize10,
                        const OverViewDetails(
                            title: 'Sleeve Length', data: 'Full Sleeves'),
                        Ksize.ksize10,
                        const OverViewDetails(
                            title: 'Fabric', data: 'Cotton Blend'),
                        Ksize.ksize10,
                        const OverViewDetails(title: 'Fit', data: 'Slim Fit')
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
        bottomNavigationBar:
            Consumer3<HomeProductController, CartController, AddressController>(
                builder: (context, value, value2, value3, child) {
          return Container(
            color: Colors.white,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 180,
                      child: CustomElevateButton(
                        size: 16,
                        text: 'Buy Now',
                        onpressed: () {
                          value3.addressList.isEmpty
                              ? Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return AddAddressScreen();
                                  },
                                ))
                              : Navigator.of(context).pushNamed(
                                  OrderPage.routename,
                                  arguments: productId);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: CustomElevateButton(
                        size: 16,
                        text: value2.cartItemsId.contains(loadProduct.id)
                            ? 'GO TO CART'
                            : 'ADD TO CART',
                        onpressed: () {
                          return value2.cartItemsId.contains(value.product?.id)
                              ? value.goToCartpage(context)
                              : value2.addToCart(
                                  loadProduct.id,
                                  value.productSize,
                                  null,
                                );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class OverViewDetails extends StatelessWidget {
  const OverViewDetails({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: SafeGoogleFont(
            'Metropolis',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.2575,
            color: Colors.grey,
            // const Color(0xff222222),
          ),
        ),
        Ksize.kWsize10,
        Text(data),
      ],
    );
  }
}
