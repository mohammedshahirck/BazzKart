import 'dart:developer';

import 'package:ecommerce/model/otp_enum_screen/otp_screen_enum.dart';
import 'package:ecommerce/model/signup_model/sign_up_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/forget/forget_password.dart';
import 'package:ecommerce/services/otp/otp_service.dart';
import 'package:ecommerce/services/signup/signup_services.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:ecommerce/view/signup/widget/otp_screen_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpController extends ChangeNotifier {
  bool passObscure = true;
  bool rePassObscure = true;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  SignUpService signUpService = SignUpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Number must be 10 digits';
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Short password';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != passwordController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void clearFields() {
    usernamecontroller.clear();
    emailcontroller.clear();
    phonecontroller.clear();
    passwordController.clear();
    confirmPassword.clear();
    notifyListeners();
  }

  void registerUser(context, FormState currentState) async {
    log('registercall');
    final SignUpModel user = SignUpModel(
      username: usernamecontroller.text,
      email: emailcontroller.text,
      phone: phonecontroller.text,
      password: passwordController.text,
    );
    final args = OtpArguementModel(
        model: user, checkScreen: OtpScreenEnum.signUpOtpScreen);
    if (currentState.validate()) {
      isLoading = true;
      notifyListeners();
      await ForgetPasswordservice()
          .userCheck(emailcontroller.text)
          .then((value) async {
        if (value == null) {
          log('no user found');
          await OtpServices().sendOtp(emailcontroller.text).then((value) async {
            log(value.toString());
            if (value != null) {
              Navigator.of(context)
                  .pushNamed(RouteNames.optPage, arguments: args)
                  .then((value) {
                isLoading = false;
                notifyListeners();
              });
              await storage.write(
                  key: 'email', value: emailcontroller.text.toString());
            } else {
              return null;
            }
          });
        } else {
          BazzToast.showToast('User already exists', Colors.grey);
        }
      });
      isLoading = false;
      notifyListeners();
    }
  }

  void setPasswordObscure() {
    passObscure = !passObscure;
    notifyListeners();
  }
}
