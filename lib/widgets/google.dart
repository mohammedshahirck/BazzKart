import 'package:ecommerce/widgets/googlesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignLog extends StatelessWidget {
  final String text;
  const GoogleSignLog({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AGSignupButton(
          style: const TextStyle(
            color: Colors.black,
          ),
          text: text,
          svg: SvgPicture.asset(
            'assets/common/google.svg',
          ),
          backgroundcolor: const Color.fromARGB(255, 204, 202, 206),
        ),
      ],
    );
  }
}
