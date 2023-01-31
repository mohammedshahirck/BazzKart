import 'package:ecommerce/helpers/kcolors.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, this.args});
  final dynamic args;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolors.bgcolor,
        title: const Text(
          'Order Details',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
