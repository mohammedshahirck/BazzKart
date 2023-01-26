import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
    this.physics,
  });
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    final wishListProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishListProvider.getWishListItems();
    });
    return Consumer2<HomeProductController, WishlistProvider>(
        builder: (context, values, values2, _) {
      return GridView.builder(
        physics: physics,
        shrinkWrap: true,
        itemCount: values.productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 1.26 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              ProductDetailPage.routeNames,
              arguments: values.productList[index].id,
            ),
            child: SizedBox(
              width: 180,
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
                      height: MediaQuery.of(context).size.height * .23,
                      width: MediaQuery.of(context).size.width * .43,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.network(
                            "http://${MainUrls.url}/products/${values.productList[index].image[0]}",
                            height: 190,
                          )
                        ],
                      )
                      //  170,
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
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            height: 1.2575,
                            color: const Color(
                              0xff222222,
                            ),
                          ),
                        ),
                        Text(
                          values.productList[index].discountPrice.toString(),
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
    });
  }
}
