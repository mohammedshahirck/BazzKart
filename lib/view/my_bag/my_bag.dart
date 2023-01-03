import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 160),
          child: Column(
            children: [
              Ksize.ksize20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ba',
                            style: GoogleFonts.hurricane(
                                fontSize: 50, color: Colors.black),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            'zz',
                            style: GoogleFonts.knewave(
                                fontSize: 30, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'My Bag',
                      style: SafeGoogleFont(
                        'Metropolis',
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                        color: Colors.black,

                        // const Color(0xff222222),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer2<HomeController, CartController>(
            builder: (context, homec, cartc, child) {
          return cartc.isLoading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.height / 2,
                  child: LoadingWidget(color: Colors.black),
                )
              : cartc.cartList == null || cartc.cartList!.products.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: Text('Cart is Empty'),
                      ),
                    )
                  : ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartc.cartList!.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Container(
                            height: 120,
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
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
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
                                          child: Row(
                                            children: [
                                              Text(
                                                'T-Shirt',
                                                style: SafeGoogleFont(
                                                  'Metropolis',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color: const Color.fromARGB(
                                                      255, 71, 68, 68),
                                                ),
                                              ),
                                              const Icon(Icons.menu),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Color :',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text('Grey '),
                                              Ksize.kWsize10,
                                              Text(
                                                'Size : ',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text('L'),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: const Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Icon(Icons.minimize),
                                                )),
                                              ),
                                            ),
                                            const Text('1'),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: const Center(
                                                    child: Icon(Icons.add)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Ksize.ksize10;
                      },
                    );
        }),
      ),
    );
  }
}
