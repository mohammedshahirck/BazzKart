import 'package:flutter/material.dart';

class CartQuantity extends StatelessWidget {
  const CartQuantity({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.quantity,
  }) : super(key: key);
  final VoidCallback decrement;
  final VoidCallback increment;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: decrement,
          child: Container(
            width: 30.0,
            height: 30.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: const Center(
                child: Text(
              '-',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
        ),
        Text(quantity.toString()),
        InkWell(
          onTap: increment,
          child: Container(
            width: 30.0,
            height: 30.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: const Center(
                child: Text(
              '+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
