import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/my_bag/widget/cart_pro_details.dart';
import 'package:ecommerce/view/my_bag/widget/cart_shimmer.dart';
import 'package:ecommerce/view/my_bag/widget/price_detail.dart';
import 'package:ecommerce/widgets/appbar.dart';
import 'package:ecommerce/widgets/custom_bottom_placeorderwidget.dart';
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
          child: Appbar(
            title: 'MyBag',
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer3<HomeController, CartController, WishlistProvider>(
            builder: (context, homec, cartc, wishPro, child) {
          return cartc.isLoading == true
              ? const CartShimmer()
              : cartc.cartList == null || cartc.cartList!.products.isEmpty
                  ? const CartEmpty()
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          CartProductDetails(
                                              name: cartc.cartList!
                                                  .products[index].product.name,
                                              image:
                                                  "http://${MainUrls.url}/products/${cartc.cartList!.products[index].product.image[0]}",
                                              price: (((cartc
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
                                                  .toInt(),
                                              index: index,
                                              qty: cartc.cartList!
                                                  .products[index].qty,
                                              size: cartc.cartList!
                                                  .products[index].size),
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
                                Ksize.ksize40,
                                PriceDetailsWidget(
                                  itemCount: cartc.totalProductCount.toString(),
                                  amount:
                                      cartc.cartList!.totalDiscount.toString(),
                                  discount: cartc.totalSave.toString(),
                                  deliveryCharge: 'Free',
                                  totalAmount:
                                      cartc.cartList!.totalPrice.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomPlaceOrderWidget(
                            ontap: () {},
                            // cartScreenProvider.toAddressScreen(
                            //   context,
                            //   OrderSummaryScreenEnum.normalOrderSummaryScreen,
                            //   null,
                            //   null,
                            // ),
                            totalAmount: cartc.cartList!.totalPrice.toString(),
                            textTitle: 'Place Order',
                          ),
                        ),
                      ],
                    );
        }),
      ),
    );
  }
}

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: const Center(
        child: Text('Cart is Empty'),
      ),
    );
  }
}
