import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class SideTitle extends StatelessWidget {
  const SideTitle({
    Key? key,
    required this.ffem,
    required this.fem,
    required this.text,
  }) : super(key: key);

  final double ffem;
  final double fem;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: SafeGoogleFont(
            'Metropolis',
            fontSize: 35 * ffem,
            fontWeight: FontWeight.w700,
            height: 1.2575 * ffem / fem,
            color: const Color(
              0xff222222,
            ),
          ),
        ),
      ],
    );
  }
}
