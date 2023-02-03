import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/order/order_control.dart';
import 'package:ecommerce/controller/providers/payment/payment_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/order_summery/order_summery.dart';
import 'package:ecommerce/view/address_view/address_view.dart';
import 'package:ecommerce/view/my_bag/widget/price_detail.dart';
import 'package:ecommerce/view/order_page/widget/order_product.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../widgets/custom_bottom_placeorderwidget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage(
      {super.key,
      required this.screenEnumcheck,
      required this.cartId,
      required this.productId});
  // static const routename = 'OrderPage';
  final OrderSummaryScreenEnum screenEnumcheck;
  final String cartId;
  final String productId;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  PaymentController paymentProvider = PaymentController();
  @override
  void initState() {
    final provider = Provider.of<PaymentController>(context, listen: false);
    super.initState();
    final razorpay = provider.razorpay;
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, provider.handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, provider.handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, provider.handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    paymentProvider.razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvier =
        Provider.of<PaymentController>(context, listen: false);
    final cartprovider = Provider.of<CartController>(context, listen: false);
    final addressProvider =
        Provider.of<AddressController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderSummaryProvider>(context, listen: false)
          .getSingleCartProduct(context, widget.productId, widget.cartId);
      paymentProvier.setAddressId(
          addressProvider.addressList[addressProvider.selectIndex].id);
      Provider.of<OrderSummaryProvider>(context, listen: false)
          .productIds
          .insert(
              0,
              cartprovider
                  .cartitemsPayId[cartprovider.cartitemsPayId.length - 1]);
    });
    return Scaffold(
        backgroundColor: Kcolors.bgcolor,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Kcolors.bgcolor,
          title: Text(
            'Review Order',
            style: SafeGoogleFont(
              'Metropolis',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 1.2575,
              color: Colors.black,
              // const Color(0xff222222),
            ),
          ),
        ),
        body: Consumer2<CartController, OrderSummaryProvider>(
            builder: (context, value, order, child) {
          return order.loading == true
              ? const LoadingWidget(color: Colors.black)
              : SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ksize.ksize40,
                            Consumer<AddressController>(
                                builder: (context, value, child) {
                              return value.isLoading == true
                                  ? const Center(
                                      child: LoadingWidget(color: Colors.black))
                                  : value.addressList.isEmpty
                                      ? const Center(
                                          child: Text('Address Empty'),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color.fromARGB(
                                                255, 233, 228, 228),
                                          ),

                                          // height: MediaQuery.of(context).size.height * .25,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Consumer<AddressController>(
                                                  builder:
                                                      (context, value, child) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Delivery to ${value.addressList[value.selectIndex].fullName},  ${value.addressList[value.selectIndex].pin}',
                                                      style: SafeGoogleFont(
                                                        'Metropolis',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.2575,
                                                        color: Colors.black,
                                                        // const Color(0xff222222),
                                                      ),
                                                    ),
                                                    Ksize.ksize10,
                                                    Text(value
                                                            .addressList.isEmpty
                                                        ? ""
                                                        : value
                                                            .addressList[value
                                                                .selectIndex]
                                                            .fullName),
                                                    Ksize.ksize5,
                                                    Text(value
                                                            .addressList.isEmpty
                                                        ? ""
                                                        : value
                                                            .addressList[value
                                                                .selectIndex]
                                                            .address),
                                                    Ksize.ksize5,
                                                    Text(value
                                                            .addressList.isEmpty
                                                        ? ""
                                                        : value
                                                            .addressList[value
                                                                .selectIndex]
                                                            .place),
                                                    Ksize.ksize5,
                                                    Text(value
                                                            .addressList.isEmpty
                                                        ? ""
                                                        : value
                                                            .addressList[value
                                                                .selectIndex]
                                                            .landMark),
                                                    Ksize.ksize5,
                                                    Text(value
                                                            .addressList.isEmpty
                                                        ? ""
                                                        : value
                                                            .addressList[value
                                                                .selectIndex]
                                                            .phone),
                                                    Ksize.ksize5,
                                                  ],
                                                );
                                              }),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .7,
                                                    child: OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                            builder: (context) {
                                                              return const AddressView();
                                                            },
                                                          ));
                                                        },
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white),
                                                        child: const Text(
                                                          'Change Address',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                            }),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return OrderProductDetails(
                                      image: widget.screenEnumcheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? "http://${MainUrls.url}/products/${value.cartList!.products[index].product.image[0]}"
                                          : "http://${MainUrls.url}/products/${order.product[0].product.image[0]}",
                                      name: widget.screenEnumcheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? value.cartList!.products[index]
                                              .product.name
                                          : order.product[0].product.name,
                                      price: widget.screenEnumcheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? value.cartList!.products[index]
                                              .product.price
                                          : order.product[0].product.price,
                                      qty: 0,
                                      size: '',
                                      // index: index,
                                      rating: widget.screenEnumcheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? value.cartList!.products[index]
                                              .product.rating
                                          : order.product[0].product.rating,
                                    );
                                  },
                                  itemCount: widget.screenEnumcheck ==
                                          OrderSummaryScreenEnum
                                              .normalOrderSummaryScreen
                                      ? value.cartList!.products.length
                                      : 1,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Ksize.ksize10;
                                  },
                                ),
                              ),
                            ),
                            Ksize.ksize10,
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              child: PriceDetailsWidget(
                                itemCount: 1.toString(),
                                amount: widget.screenEnumcheck ==
                                        OrderSummaryScreenEnum
                                            .normalOrderSummaryScreen
                                    ? (value.cartList!.totalPrice).toString()
                                    : (order.product[0].product.price)
                                        .toString(),
                                discount: widget.screenEnumcheck ==
                                        OrderSummaryScreenEnum
                                            .normalOrderSummaryScreen
                                    ? (value.cartList!.totalDiscount)
                                        .toStringAsFixed(0)
                                    : (order.product[0].product.discountPrice)
                                        .toStringAsFixed(0),
                                // provider.discountPrice.toString(),
                                deliveryCharge: 'Free',
                                totalAmount: widget.screenEnumcheck ==
                                        OrderSummaryScreenEnum
                                            .normalOrderSummaryScreen
                                    ? (value.cartList!.totalPrice -
                                            value.cartList!.totalDiscount)
                                        .toString()
                                    : (order.product[0].product.price -
                                            order.product[0].discountPrice)
                                        .toStringAsFixed(0),
                                // ((provider.price) - (provider.discountPrice))
                                //     .toString(),
                              ),
                            ),
                            Ksize.ksize80,
                          ],
                        ),
                      ),
                      Consumer<AddressController>(
                          builder: (context, address, child) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomPlaceOrderWidget(
                            ontap: () {
                              paymentProvider.setTotalAmount(
                                widget.screenEnumcheck ==
                                        OrderSummaryScreenEnum
                                            .normalOrderSummaryScreen
                                    ? int.parse((value.cartList!.totalPrice -
                                            value.cartList!.totalDiscount)
                                        .round()
                                        .toString())
                                    : int.parse((order.product[0].price -
                                            order.product[0].discountPrice)
                                        .round()
                                        .toString()),
                                widget.screenEnumcheck ==
                                        OrderSummaryScreenEnum
                                            .normalOrderSummaryScreen
                                    ? value.cartitemsPayId
                                    : order.productIds,
                                address.addressList[address.selectIndex].id,
                              );
                              // paymentProvider.openCheckout(
                              //   widget.screenEnumcheck ==
                              //           OrderSummaryScreenEnum
                              //               .normalOrderSummaryScreen
                              //       ? value.cartList!.totalPrice -
                              //           value.cartList!.totalDiscount.round()
                              //       : order.product[0].product.price -
                              //           order.product[0].product.discountPrice,

                              //   // ((provider.price) - (provider.discountPrice))
                              //   //     .toString(),
                              // );
                            },
                            totalAmount: (widget.screenEnumcheck ==
                                    OrderSummaryScreenEnum
                                        .normalOrderSummaryScreen
                                ? (value.cartList!.totalPrice -
                                        value.cartList!.totalDiscount)
                                    .toStringAsFixed(0)
                                : (order.product[0].product.price -
                                        order.product[0].product.discountPrice)
                                    .toStringAsFixed(0)),
                            textTitle: 'Continue',
                          ),
                        );
                      }),
                    ],
                  ),
                );
        }));
  }
}
