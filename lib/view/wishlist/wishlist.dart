import 'dart:developer';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/view/wishlist/widget/no_wishlist.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  static const wishList = "/wishlist";
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WishlistProvider>(context, listen: false).getWishListItems();
    });
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          title: Column(
            children: [
              Text(
                'Wishlist',
                style: SafeGoogleFont(
                  'Metropolis',
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                  color: Colors.black,

                  // const Color(0xff222222),
                ),
              ),
              Text(
                '${wishlistProvider.favorProduct.length}  items',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              )
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
                    : GridView.builder(
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
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              ProductDetailPage.routeNames,
                              arguments: wishvalue
                                  .wishList!.products[index].product.id,
                            ),
                            child: SizedBox(
                              width: 210,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 233, 231, 231)
                                            .withOpacity(1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .29,
                                      width: MediaQuery.of(context).size.width *
                                          .43,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  title: const Text(
                                                      ' Remove from wishlist?'),
                                                  content: const Text(
                                                      'Are you sure to delete this product from wishlist?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, 'NO'),
                                                      child: const Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        wishvalue
                                                            .addRemoveWishlistItem(
                                                                wishvalue
                                                                    .wishList!
                                                                    .products[
                                                                        index]
                                                                    .product
                                                                    .id);
                                                        Navigator.pop(
                                                          context,
                                                          'Yes',
                                                        );
                                                      },
                                                      child: const Text('Yes'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Image.network(
                                            "http://${MainUrls.url}/products/${wishvalue.wishList!.products[index].product.image[0]}",
                                            height: 170,
                                          )
                                        ],
                                      )
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
                            ),
                          );
                        },
                      );
          }),
        ],
      ),
    );
  }
}
