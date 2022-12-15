import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';

class LoginOrSignUpButton extends StatelessWidget {
  const LoginOrSignUpButton(
      {super.key,
      required this.startingText,
      required this.mainText,
      required this.onTap});
  final String startingText;
  final String mainText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startingText,
          style: const TextStyle(
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
        Ksize.ksize10,
        TextButton(
          onPressed: onTap,
          child: Text(
            mainText,
            style: const TextStyle(
              color: Color(0xff293b55),
            ),
          ),
        ),
      ],
    );
  }
}
