import 'package:ecommerce/controller/providers/login/login_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:ecommerce/widgets/google.dart';
import 'package:ecommerce/widgets/login_or_signup.dart';
import 'package:ecommerce/widgets/or_seperation.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ba', style: GoogleFonts.hurricane(fontSize: 100)),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'zz',
                      style: GoogleFonts.knewave(fontSize: 60),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: loginController.formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 60),
                            // EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'Login',
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
                      TextsField(
                        controller: loginController.emailController,
                        hintText: '    E-mail   ',
                        isPassword: false,
                        obscure: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return loginController.emailValidation(value);
                        },
                        tiaction: TextInputAction.next,
                      ),
                      Ksize.ksize20,
                      Consumer<LoginController>(
                          builder: (context, value, child) {
                        return TextsField(
                          controller: loginController.passController,
                          hintText: '     Password     ',
                          isPassword: true,
                          obscure: value.passObscure,
                          keyboardType: TextInputType.text,
                          suffixOntap: () {
                            loginController.setPasswordObscure();
                          },
                          validator: (value) =>
                              loginController.passwordValidation(value),
                          tiaction: TextInputAction.next,
                        );
                      }),
                      Ksize.ksize10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              loginController.toForgotPasswordScreen(context);
                            },
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Ksize.ksize10,
                      Consumer<LoginController>(
                          builder: (context, value, Widget? child) {
                        return value.isLoading == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : CustomElevateButton(
                                size: 14 * ffem,
                                text: 'Login',
                                onpressed: () {
                                  value.login(
                                      context, value.formKey.currentState!);
                                },
                              );
                      }),
                      Ksize.ksize10,
                      const OrSepration(),
                      Ksize.ksize10,
                      const GoogleSignLog(text: 'Sign Up With Google'),
                      Ksize.ksize20,
                      LoginOrSignUpButton(
                        startingText: 'Don\'t have an account?',
                        mainText: 'Create new.',
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.signUpPage);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
