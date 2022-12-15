import 'package:ecommerce/controller/providers/login/login_controller.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({
    Key? key,
    required this.loginController,
    required this.ffem,
  }) : super(key: key);

  final LoginController loginController;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff293b55),
        ),
      ),
      onPressed: () async {
        loginController.clearFields();
      },
      child: Text(
        'LOGIN',
        style: SafeGoogleFont('Metropolis',
            letterSpacing: 1,
            fontSize: 14 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.4285714286,
            color: Colors.white),
      ),
    );
  }
}
