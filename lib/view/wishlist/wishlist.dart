import 'dart:developer';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/view/wishlist/widget/no_wishlist.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  static const wishList = "/wishlist";
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WishlistProvider>(context, listen: false).getWishListItems();
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          title: Row(
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
                    style:
                        GoogleFonts.knewave(fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 32,
                )),
          ],
          elevation: 0,
          backgroundColor: Kcolors.bgcolor,
        ),
      ),
      body: ListView(
        children: [
          Consumer2<HomeProductController, WishlistProvider>(
              builder: (context, prodValue, wishvalue, child) {
            return wishvalue.isLoading == true
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: double.infinity,
                    child: const Center(
                      child: LoadingWidget(
                        color: Colors.black,
                      ),
                    ),
                  )
                : wishvalue.wishList == null ||
                        wishvalue.wishList!.products.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(child: ReloadWishlist()),
                      )
                    : Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1.1 / 2,
                          ),
                          // itemCount: ,
                          itemCount: wishvalue.wishList!.products.length,
                          itemBuilder: (context, index) {
                            log('gridview');
                            return SizedBox(
                              width: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.bottomCenter,
                                          image: NetworkImage(
                                              "http://${MainUrls.url}/products/${wishvalue.wishList!.products[index].product.image[0]}"
                                              // "http://${MainUrls.url}/products/${values.productList[index].image[0]}",
                                              ),
                                        ),
                                        color: const Color.fromARGB(
                                                255, 233, 231, 231)
                                            .withOpacity(1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .29,
                                      width: MediaQuery.of(context).size.width *
                                          .43
                                      //  170,
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          wishvalue.wishList!.products[index]
                                              .product.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: SafeGoogleFont(
                                            'Metropolis',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2575,
                                            color: const Color(
                                              0xff222222,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          wishvalue.wishList!.products[index]
                                              .product.discountPrice
                                              .toString(),
                                          style: const TextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
          }),
        ],
      ),
    );
  }
}
