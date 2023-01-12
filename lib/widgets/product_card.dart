import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.argument,
    required this.ffem,
    required this.fem,
    required this.image,
    required this.name,
    required this.price,
    required this.offer,
    required this.rating,
  }) : super(key: key);

  final double ffem;
  final double fem;
  final Object? argument;
  final String image;
  final String name;
  final String price;
  final String offer;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailPage.routeNames, arguments: argument);
      },
      child: SizedBox(
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 231, 231).withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    image,
                    //
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
                    name,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        //
                        style: const TextStyle(),
                      ),
                      Text(
                        offer,
                        //
                        style: const TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        rating,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
