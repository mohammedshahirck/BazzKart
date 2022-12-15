import 'package:ecommerce/controller/providers/forget/forget_controller.dart';

import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetController =
        Provider.of<ForgetController>(context, listen: false);
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    // EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Text(
                      '\t\t   FORGET\n \tPASSWORD',
                      style: SafeGoogleFont(
                        'Metropolis',
                        fontSize: 34 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2575 * ffem / fem,
                        color: Colors.black,
                        // const Color(0xff222222),
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: forgetController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Provide your account\'s email for which you want \n\t\t\t                  to reset your password',
                      style: GoogleFonts.alegreyaSans(letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextsField(
                      hintText: '    E-mail   ',
                      isPassword: false,
                      obscure: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return forgetController
                            .findAccountTextfieldValidation(value);
                      },
                      tiaction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<ForgetController>(
                        builder: (context, value, child) {
                      return value.isLoading == true
                          ? const LoadingWidget()
                          : CustomElevateButton(
                              size: 14 * ffem,
                              text: 'Continue',
                              onpressed: () {
                                // value.toOtpScreen(
                                //   context,
                                //   value.formKey.currentState!,
                                // );
                              },
                            );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
