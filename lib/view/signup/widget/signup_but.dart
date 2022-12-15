import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.ffem,
    required this.onPresed,
  }) : super(key: key);

  final double ffem;
  final VoidCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            const Color(0xff293b55),
          ),
        ),
        onPressed: onPresed,
        child: Text(
          'SIGN UP',
          style: SafeGoogleFont('Metropolis',
              letterSpacing: 1,
              fontSize: 14 * ffem,
              fontWeight: FontWeight.w600,
              height: 1.4285714286,
              color: Colors.white),
        ),
      ),
    );
  }
}
