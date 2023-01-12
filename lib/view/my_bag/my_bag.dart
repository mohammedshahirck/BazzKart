import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/shimmer.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 80),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              children: [
                Ksize.ksize20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'My Bag',
                            style: SafeGoogleFont(
                              'Metropolis',
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              height: 1.5,
                              color: Colors.black,

                              // const Color(0xff222222),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer3<HomeController, CartController, WishlistProvider>(
            builder: (context, homec, cartc, wishPro, child) {
          return cartc.isLoading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(
                    child: Text('Cart is Empty'),
                  ),
                )
              : cartc.cartList == null || cartc.cartList!.products.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                          itemBuilder: (context, index) => Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      ShimmerWidget.rectangle(
                                          height: 120, width: 120),
                                    ],
                                  ),
                                  Ksize.kWsize10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      ShimmerWidget.rectangle(
                                          height: 10, width: 180),
                                      Ksize.ksize10,
                                      ShimmerWidget.rectangle(
                                          height: 10, width: 90),
                                      Ksize.ksize10,
                                      ShimmerWidget.rectangle(
                                          height: 10, width: 150),
                                      Ksize.ksize10,
                                      ShimmerWidget.rectangle(
                                        height: 10,
                                        width: 160,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index) => Ksize.ksize10,
                          itemCount: 5),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartc.cartList!.products.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 134,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          // bottomLeft: Radius.circular(10),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 233, 231, 231),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "http://${MainUrls.url}/products/${cartc.cartList!.products[index].product.image[0]}",
                                          ),
                                        ),
                                      ),
                                      // color: Colors.black,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 220,
                                            child: Text(
                                              cartc.cartList!.products[index]
                                                  .product.name,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: SafeGoogleFont(
                                                'Metropolis',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromARGB(
                                                    255, 71, 68, 68),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Price :',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text((((cartc
                                                              .cartList!
                                                              .products[index]
                                                              .product
                                                              .price) -
                                                          (cartc
                                                              .cartList!
                                                              .products[index]
                                                              .product
                                                              .discountPrice)) *
                                                      (cartc.cartList!
                                                          .products[index].qty))
                                                  .toString()),
                                              Ksize.kWsize10,
                                              const Text(
                                                'Size : ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(cartc.cartList!
                                                  .products[index].size),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            CartQuantity(
                                              decrement: () => cartc
                                                  .incrementOrDecrementQuantity(
                                                -1,
                                                cartc.cartList!.products[index]
                                                    .product.id,
                                                cartc.cartList!.products[index]
                                                    .size,
                                                cartc.cartList!.products[index]
                                                    .qty,
                                              ),
                                              increment: () => cartc
                                                  .incrementOrDecrementQuantity(
                                                1,
                                                cartc.cartList!.products[index]
                                                    .product.id,
                                                cartc.cartList!.products[index]
                                                    .size,
                                                cartc.cartList!.products[index]
                                                    .qty,
                                              ),
                                              quantity: cartc.cartList!
                                                  .products[index].qty,
                                            ),
                                            Ksize.kWsize20,
                                            Ksize.kWsize20,
                                            RemoveFromMybagButton(
                                              ontap: () {
                                                cartc.removeFromCart(cartc
                                                    .cartList!
                                                    .products[index]
                                                    .product
                                                    .id);

                                                Navigator.pop(
                                                  context,
                                                  'Remove',
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Ksize.ksize5,
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return Ksize.ksize10;
                        },
                      ),
                    );
        }),
      ),
    );
  }
}

class RemoveFromMybagButton extends StatelessWidget {
  const RemoveFromMybagButton({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Text(' Remove from bag?'),
                content:
                    const Text('Are you sure to delete this product from bag?'),
                actions: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      ontap;
                      // wishPro.addRemoveWishlistItem(
                      //     cartc.cartList!.products[index].product.id);
                      Navigator.pop(
                        context,
                        'Move to Wishlist',
                      );
                    },
                    child: const Text(
                      'Move to Wishlist',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ontap,
                    child: const Text('Remove'),
                  ),
                ],
              ),
            ),
        child: const Text(
          'Remove',
          style: TextStyle(color: Colors.black),
        ));
  }
}

class CartQuantity extends StatelessWidget {
  const CartQuantity({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.quantity,
  }) : super(key: key);
  final VoidCallback decrement;
  final VoidCallback increment;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: decrement,
          child: Container(
            width: 30.0,
            height: 30.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: const Center(
                child: Text(
              '-',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
        ),
        Text(quantity.toString()),
        InkWell(
          onTap: increment,
          child: Container(
            width: 30.0,
            height: 30.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: const Center(
                child: Text(
              '+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
