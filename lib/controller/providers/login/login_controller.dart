import 'package:ecommerce/model/login_model/login_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  bool passObscure = true;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void toSignUpScreen(context) {
    clearFields();
    Navigator.of(context).pushNamed(RouteNames.signUpPage);
  }

  void toForgotPasswordScreen(context) {
    clearFields();
    Navigator.of(context).pushNamed(RouteNames.forgetPassword);
  }

  void login(context, FormState currentState) async {
    if (currentState.validate()) {
      isLoading = true;
      notifyListeners();
      final LoginModel model = LoginModel(
        email: emailController.text,
        password: passController.text,
      );
      await SignInService().login(model).then((value) async {
        if (value != null) {
          await storage.write(key: 'token', value: value.accessToken);
          await storage.write(key: 'refreshToken', value: value.refreshToken);
          await storage.write(
              key: 'email', value: emailController.text.toString());
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
          clearFields();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
        }
      });
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
      return 'Please enter password';
    } else {
      return null;
    }
  }

  void setPasswordObscure() {
    passObscure = !passObscure;
    notifyListeners();
  }

  void clearFields() {
    emailController.clear();
    passController.clear();
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
