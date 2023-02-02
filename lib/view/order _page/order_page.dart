import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, this.args});
  final dynamic args;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) {
                  return const BottomNav();
                },
              ), (route) => false);
            },
            icon: const Icon(Icons.arrow_back)),
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
