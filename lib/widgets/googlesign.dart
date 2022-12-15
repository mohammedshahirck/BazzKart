import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';

class AGSignupButton extends StatelessWidget {
  const AGSignupButton({
    Key? key,
    required this.text,
    required this.style,
    this.width,
    required this.svg,
    required this.backgroundcolor,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final double? width;
  final Widget svg;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundcolor,
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Ksize.ksize10,
            svg,
            Ksize.ksize20,
            Text(
              text,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
