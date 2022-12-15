import 'package:ecommerce/controller/providers/signup/singnup_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signupcontroller = Provider.of<SignUpController>(
      context,
      listen: false,
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   signupcontroller.clearFields();
    // });
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
                    Text(
                      'Ba',
                      style: GoogleFonts.hurricane(
                        fontSize: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'zz',
                      style: GoogleFonts.knewave(
                        fontSize: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: signupcontroller.formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 60,
                            ),
                            // EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'Sign Up',
                              style: SafeGoogleFont(
                                'Metropolis',
                                fontSize: 34 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2575 * ffem / fem,
                                color: const Color(
                                  0xff222222,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextsField(
                        controller: signupcontroller.usernamecontroller,
                        hintText: '   UserName   ',
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return signupcontroller.nameValidation(value);
                        },
                        tiaction: TextInputAction.next,
                      ),
                      Ksize.ksize20,
                      TextsField(
                        controller: signupcontroller.emailcontroller,
                        hintText: '   E-mail   ',
                        keyboardType: TextInputType.emailAddress,
                        tiaction: TextInputAction.next,
                        validator: (value) =>
                            signupcontroller.emailValidation(value),
                      ),
                      Ksize.ksize20,
                      TextsField(
                        controller: signupcontroller.phonecontroller,
                        hintText: '   Phone   ',
                        keyboardType: TextInputType.number,
                        tiaction: TextInputAction.next,
                        validator: (value) =>
                            signupcontroller.numberValidation(value),
                      ),
                      Ksize.ksize20,
                      Consumer<SignUpController>(
                          builder: (context, value, child) {
                        return Column(
                          children: [
                            TextsField(
                              isPassword: true,
                              obscure: value.passObscure,
                              controller: signupcontroller.passwordController,
                              hintText: '   Password   ',
                              suffixOntap: () {
                                signupcontroller.setPasswordObscure();
                              },
                              validator: (value) =>
                                  signupcontroller.passwordValidation(value),
                              keyboardType: TextInputType.text,
                              tiaction: TextInputAction.next,
                            ),
                            Ksize.ksize20,
                            TextsField(
                              controller: signupcontroller.confirmPassword,
                              obscure: value.passObscure,
                              hintText: '   Confirm Password   ',
                              keyboardType: TextInputType.text,
                              tiaction: TextInputAction.next,
                              validator: (value) => signupcontroller
                                  .confirmPasswordValidation(value),
                            ),
                          ],
                        );
                      }),
                      Ksize.ksize20,
                      Consumer<SignUpController>(
                        builder: (context, value, _) {
                          return value.isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : CustomElevateButton(
                                  size: 16,
                                  text: 'Sign Up',
                                  onpressed: () => value.registerUser(
                                      context, value.formKey.currentState!),
                                );
                        },
                      ),
                      // LoginOrSignUpButton(
                      //   startingText: 'All Ready have an account?',
                      //   mainText: 'Sign in',
                      //   onTap: () {
                      //     Navigator.pushNamed(
                      //       context,
                      //       RouteNames.loginPage,
                      //     );
                      //   },
                      // )
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
