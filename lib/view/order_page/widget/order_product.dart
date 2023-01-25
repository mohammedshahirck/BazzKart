import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
    required this.size,
    // required this.index,
    required this.rating,
  }) : super(key: key);
  final String image;
  final String name;
  final int price;
  final String rating;
  final int qty;
  final String size;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)
                // bottomLeft: Radius.circular(10),
                ),
            color: const Color.fromARGB(255, 233, 231, 231),
            image: DecorationImage(
              image: NetworkImage(
                image,
                //
              ),
            ),
          ),
        ),
        Ksize.kWsize15,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                name,
                //
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: SafeGoogleFont(
                  'Metropolis',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 71, 68, 68),
                ),
              ),
            ),
            Ksize.ksize10,
            Row(
              children: [
                const Text(
                  'Price :',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(price.toString()),
                Ksize.kWsize10,
                const Text(
                  'Size : ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  size,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(rating),
              ],
            )
          ],
        )
      ],
    );
  }
}
