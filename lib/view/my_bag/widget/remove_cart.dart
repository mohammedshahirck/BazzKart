import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoveFromMybagButton extends StatelessWidget {
  const RemoveFromMybagButton({
    Key? key,
    required this.ontap,
    required this.index,
  }) : super(key: key);

  final void Function()? ontap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer2<WishlistProvider, CartController>(
        builder: (context, wishPro, cartc, child) {
      return OutlinedButton(
          onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text(' Remove from bag?'),
                  content: const Text(
                      'Are you sure to delete this product from bag?'),
                  actions: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        ontap;
                        wishPro.addRemoveWishlistItem(
                            cartc.cartList!.products[index].product.id);
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
    });
  }
}
