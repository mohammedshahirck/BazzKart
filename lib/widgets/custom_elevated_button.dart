import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CustomElevateButton extends StatelessWidget {
  const CustomElevateButton({
    super.key,
    required this.size,
    required this.text,
    required this.onpressed,
  });
  final double size;
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
          backgroundColor: MaterialStateProperty.all(
            const Color(0xff293b55),
          ),
        ),
        child: Text(
          text,
          style: SafeGoogleFont('Metropolis',
              letterSpacing: 1,
              fontSize: size,
              fontWeight: FontWeight.w600,
              height: 1.4285714286,
              color: Colors.white),
        ),
      ),
    );
  }
}
