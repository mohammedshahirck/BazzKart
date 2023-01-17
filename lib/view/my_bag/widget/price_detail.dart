import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/my_bag/widget/detail_price.dart';
import 'package:flutter/material.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
    required this.itemCount,
    required this.amount,
    required this.discount,
    required this.deliveryCharge,
    required this.totalAmount,
  });
  final String itemCount;
  final String discount;
  final String deliveryCharge;
  final String totalAmount;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Ksize.ksize20,
        DetailsPrice(
          text1: 'Price($itemCount)',
          text2: amount,
        ),
        Ksize.ksize5,
        DetailsPrice(
          text1: 'Discount',
          text2: '- ₹$discount',
          color2: Colors.green,
          rupeeSymbol: true,
        ),
        Ksize.ksize5,
        DetailsPrice(
          text1: 'Delivery Charges',
          text2: deliveryCharge,
          color2: Colors.green,
          rupeeSymbol: true,
        ),
        Ksize.ksize5,
        const Divider(thickness: 1),
        Ksize.ksize5,
        DetailsPrice(
          text1: 'Total Amount',
          text2: totalAmount,
          fontWeight: FontWeight.bold,
        ),
        Ksize.ksize5,
        const Divider(thickness: 1),
        Ksize.ksize20,
        Row(
          children: [
            Icon(
              Icons.verified,
              color: Colors.green,
            ),
            Text(
              'You will save ₹$discount on this order',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
        Ksize.ksize20,
      ],
    );
  }
}
