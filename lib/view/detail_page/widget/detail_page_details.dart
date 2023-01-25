import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:flutter/material.dart';

class DetailPageDetails extends StatelessWidget {
  const DetailPageDetails({
    Key? key,
    required this.loadProduct,
  }) : super(key: key);

  final ProductModel loadProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              loadProduct.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Ksize.ksize10,
            Row(
              children: [
                Text("₹${(loadProduct.price) - (loadProduct.discountPrice)}"),
                Ksize.kWsize10,
                Text(
                  "₹${loadProduct.price.toString()}",
                  style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                Ksize.kWsize10,
                Text(
                  "${loadProduct.offer}% off",
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
            Ksize.ksize10,
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(loadProduct.rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
