import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.ffem,
    required this.fem,
  }) : super(key: key);

  final double ffem;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProductController, WishlistProvider>(
        builder: (context, values, values2, child) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductDetailPage.routeNames,
                      arguments: values.productList[index].id);
                },
                child: SizedBox(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 231, 231)
                              .withOpacity(1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 200,
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.network(
                              "http://${MainUrls.url}/products/${values.productList[index].image[0]}",
                              height: 170,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              values.productList[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: SafeGoogleFont(
                                'Metropolis',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2575 * ffem / fem,
                                color: const Color(
                                  0xff222222,
                                ),
                              ),
                            ),
                            Text(
                              "₹${((values.productList[index].price) - (values.productList[index].discountPrice)).toString()}",
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
            itemCount: values.productList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
      );
    });
  }
}
