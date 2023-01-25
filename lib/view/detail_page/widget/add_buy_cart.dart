import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBuyAndCart extends StatelessWidget {
  const AddBuyAndCart({
    Key? key,
    required this.loadProduct,
    required this.productId,
  }) : super(key: key);

  final ProductModel loadProduct;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeProductController, CartController, AddressController>(
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
                // SizedBox(
                //   width: 180,
                //   child: CustomElevateButton(
                //     size: 16,
                //     text: 'Buy Now',
                //     onpressed: () {
                //       value2.cartItemsId.contains(value.product?.id)
                //           ? value.goToCartpage(context)
                //           : value2.addToCart(
                //               loadProduct.id,
                //               value.productSize,
                //               OrderSummaryScreenEnum
                //                   .buyOneProductOrderSummaryScreen);
                //       value.gotoOrderpage(
                //           productId, context, value.productSize.toString());
                //     },
                //   ),
                // ),
                SizedBox(
                    width: 180,
                    child:
                        //  value2.cartItemsId.contains(loadProduct.id)
                        //     ? CustomElevateButton(
                        //         text: 'GO TO CART',
                        //         size: 16,
                        //         onpressed: () {
                        //           value.goToCart(context);
                        //         },
                        //       )
                        //     :
                        CustomElevateButton(
                      size: 16,
                      text: 'ADD TO CART',
                      //     : 'ADD TO CART',
                      onpressed: () {
                        value2.addToCart(
                          loadProduct.id,
                          value.productSize,
                          null,
                        );
                      },
                    )),
              ],
            )
          ],
        ),
      );
    });
  }
}
