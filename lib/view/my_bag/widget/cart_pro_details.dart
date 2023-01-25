import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/order/order_control.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/my_bag/widget/cart_quantity.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/text_style.dart';
import 'remove_cart.dart';

class CartProductDetails extends StatelessWidget {
  const CartProductDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
    required this.size,
    required this.index,
  }) : super(key: key);
  final String image;
  final String name;
  final int price;

  final int qty;
  final String size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartController, OrderSummaryProvider>(
        builder: (context, cartc, order, child) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 184,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                // bottomLeft: Radius.circular(10),
              ),
              color: const Color.fromARGB(255, 233, 231, 231),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                  //
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 220,
                  child: Text(
                    name,
                    //
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: SafeGoogleFont(
                      'Metropolis',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 71, 68, 68),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    const Text(
                      'Price :',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(price.toString()),
                    Ksize.kWsize10,
                    const Text(
                      'Size : ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      size,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CartQuantity(
                    decrement: () => cartc.incrementOrDecrementQuantity(
                      -1,
                      cartc.cartList!.products[index].product.id,
                      cartc.cartList!.products[index].size,
                      cartc.cartList!.products[index].qty,
                    ),
                    increment: () => cartc.incrementOrDecrementQuantity(
                      1,
                      cartc.cartList!.products[index].product.id,
                      cartc.cartList!.products[index].size,
                      cartc.cartList!.products[index].qty,
                    ),
                    quantity: cartc.cartList!.products[index].qty,
                  ),
                  Ksize.kWsize20,
                  Ksize.kWsize20,
                  RemoveFromMybagButton(
                    ontap: () {
                      cartc.removeFromCart(
                          cartc.cartList!.products[index].product.id);

                      Navigator.pop(
                        context,
                        'Remove',
                      );
                    },
                    index: index,
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                child: CustomElevateButton(
                  size: 16,
                  text: 'Buy Now',
                  onpressed: () {
                    order.toOderScreen(
                        context,
                        cartc.cartList!.products[index].product.id,
                        cartc.cartList!.id);
                  },
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
