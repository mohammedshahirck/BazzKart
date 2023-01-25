import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class OverViewDetails extends StatelessWidget {
  const OverViewDetails({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: SafeGoogleFont(
            'Metropolis',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.2575,
            color: Colors.grey,
            // const Color(0xff222222),
          ),
        ),
        Ksize.kWsize10,
        Text(data),
      ],
    );
  }
}
