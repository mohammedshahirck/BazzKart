import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/payment/payment_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/order_summery/order_summery.dart';
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
  static const routename = 'OrderPage';
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
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final provider = Provider.of<HomeProductController>(context, listen: false)
        .findById(productId);
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
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ksize.ksize40,
                  Consumer<AddressController>(builder: (context, value, child) {
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
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(255, 233, 228, 228),
                                ),

                                // height: MediaQuery.of(context).size.height * .25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Consumer<AddressController>(
                                        builder: (context, value, child) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Delivery to ${value.addressList[0].fullName},  ${value.addressList[0].pin}',
                                            style: SafeGoogleFont(
                                              'Metropolis',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1.2575,
                                              color: Colors.black,
                                              // const Color(0xff222222),
                                            ),
                                          ),
                                          Ksize.ksize10,
                                          Text(value.addressList.isEmpty
                                              ? ""
                                              : value.addressList[0].fullName),
                                          Ksize.ksize5,
                                          Text(value.addressList.isEmpty
                                              ? ""
                                              : value.addressList[0].address),
                                          Ksize.ksize5,
                                          Text(value.addressList.isEmpty
                                              ? ""
                                              : value.addressList[0].place),
                                          Ksize.ksize5,
                                          Text(value.addressList.isEmpty
                                              ? ""
                                              : value.addressList[0].landMark),
                                          Ksize.ksize5,
                                          Text(value.addressList.isEmpty
                                              ? ""
                                              : value.addressList[0].phone),
                                          Ksize.ksize5,
                                        ],
                                      );
                                    }),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .7,
                                          child: OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.white),
                                              child: const Text(
                                                'Change Address',
                                                style: TextStyle(
                                                    color: Colors.black),
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
                      child: OrderProductDetails(
                        image:
                            "http://${MainUrls.url}/products/${provider.image[0]}",
                        name: provider.name,
                        price: provider.price,
                        qty: 0,
                        size: provider.size[2],
                        index: 1,
                        rating: provider.rating,
                      ),
                    ),
                  ),
                  Ksize.ksize10,
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: PriceDetailsWidget(
                      itemCount: 1.toString(),
                      amount: provider.price.toString(),
                      discount: provider.discountPrice.toString(),
                      deliveryCharge: 'Free',
                      totalAmount: ((provider.price) - (provider.discountPrice))
                          .toString(),
                    ),
                  ),
                  Ksize.ksize80,
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomPlaceOrderWidget(
                ontap: () {
                  paymentProvider.openCheckout(int.parse(
                    ((provider.price) - (provider.discountPrice)).toString(),
                  ));
                },
                totalAmount:
                    ((provider.price) - (provider.discountPrice)).toString(),
                textTitle: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
