import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';

class CustomBottomPlaceOrderWidget extends StatelessWidget {
  const CustomBottomPlaceOrderWidget({
    super.key,
    required this.ontap,
    required this.totalAmount,
    required this.textTitle,
  });
  final void Function() ontap;
  final String totalAmount;
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Kcolors.bgcolor,
        border: Border(
          top: BorderSide(color: Colors.black),
        ),
      ),
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Ksize.kWsize20,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total Amount',
                ),
                Text(
                  '₹$totalAmount',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: ontap,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: const Color(0xff293b55),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    textTitle,
                    style: const TextStyle(
                      color: Kcolors.bgcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Ksize.kWsize20,
          ],
        ),
      ),
    );
  }
}
