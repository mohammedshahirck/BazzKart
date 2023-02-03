import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/controller/providers/order/order_control.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/order_summery/order_summery.dart';
import 'package:ecommerce/view/address_view/address_view.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/view/my_bag/widget/cart_empty.dart';
import 'package:ecommerce/view/my_bag/widget/cart_pro_details.dart';
import 'package:ecommerce/view/my_bag/widget/cart_shimmer.dart';
import 'package:ecommerce/view/my_bag/widget/price_detail.dart';
import 'package:ecommerce/view/order_page/order_page.dart';
import 'package:ecommerce/widgets/appbar.dart';
import 'package:ecommerce/widgets/custom_bottom_placeorderwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CartController>(context, listen: false).getCart();
    });
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 80),
          child: Appbar(
            title: 'MyBag',
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer4<HomeController, CartController, WishlistProvider,
                  OrderSummaryProvider>(
              builder: (context, homec, cartc, wishPro, order, child) {
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: cartc.cartList!.products.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 190,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context,
                                                    ProductDetailPage
                                                        .routeNames,
                                                    arguments: cartc
                                                        .cartList!
                                                        .products[index]
                                                        .product
                                                        .id);
                                              },
                                              child: CartProductDetails(
                                                  name: cartc
                                                      .cartList!
                                                      .products[index]
                                                      .product
                                                      .name,
                                                  image:
                                                      "http://${MainUrls.url}/products/${cartc.cartList!.products[index].product.image[0]}",
                                                  price: (((cartc
                                                                  .cartList!
                                                                  .products[
                                                                      index]
                                                                  .product
                                                                  .price) -
                                                              (cartc
                                                                  .cartList!
                                                                  .products[
                                                                      index]
                                                                  .product
                                                                  .discountPrice)) *
                                                          (cartc
                                                              .cartList!
                                                              .products[index]
                                                              .qty))
                                                      .toInt(),
                                                  index: index,
                                                  qty: cartc.cartList!
                                                      .products[index].qty,
                                                  size: cartc.cartList!
                                                      .products[index].size),
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
                                  Ksize.ksize40,
                                  PriceDetailsWidget(
                                      itemCount:
                                          cartc.totalProductCount.toString(),
                                      amount:
                                          cartc.cartList!.totalPrice.toString(),
                                      discount: cartc.cartList!.totalDiscount
                                          .toStringAsFixed(0),
                                      deliveryCharge: 'Free',
                                      totalAmount: (cartc.cartList!.totalPrice -
                                              cartc.cartList!.totalDiscount)
                                          .toStringAsFixed(0)),
                                ],
                              ),
                            ),
                          ),
                          Consumer<AddressController>(
                              builder: (context, address, child) {
                            return Align(
                                alignment: Alignment.bottomCenter,
                                child: address.addressList.isEmpty
                                    ? CustomBottomPlaceOrderWidget(
                                        ontap: () {
                                          Navigator.of(context)
                                              .push(CupertinoPageRoute(
                                            builder: (context) {
                                              return const AddressView();
                                            },
                                          ));
                                        },
                                        totalAmount: (cartc
                                                    .cartList!.totalPrice -
                                                cartc.cartList!.totalDiscount)
                                            .toStringAsFixed(0),
                                        textTitle: 'Go To Address',
                                      )
                                    : CustomBottomPlaceOrderWidget(
                                        ontap: () {
                                          Navigator.of(context)
                                              .push(CupertinoPageRoute(
                                            builder: (context) {
                                              return const OrderPage(
                                                  screenEnumcheck:
                                                      OrderSummaryScreenEnum
                                                          .normalOrderSummaryScreen,
                                                  cartId: '',
                                                  productId: '');
                                            },
                                          ));
                                          order.loading = false;
                                        },
                                        totalAmount: (cartc
                                                    .cartList!.totalPrice -
                                                cartc.cartList!.totalDiscount)
                                            .toStringAsFixed(0),
                                        textTitle: 'Place Order',
                                      ));
                          }),
                        ],
                      );
          }),
        ),
      ),
    );
  }
}
