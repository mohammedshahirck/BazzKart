import 'package:ecommerce/model/otp_enum_screen/otp_screen_enum.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/forget/forget_password.dart';
import 'package:ecommerce/services/otp/otp_service.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:ecommerce/view/signup/widget/otp_screen_argument.dart';
import 'package:flutter/material.dart';

class ForgetController extends ChangeNotifier {
  bool isLoading = false;
  final TextEditingController findAccountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void toOtpScreen(context, FormState currentState) {
    if (currentState.validate()) {
      isLoading = true;
      notifyListeners();
      ForgetPasswordservice()
          .userCheck(findAccountController.text)
          .then((model) {
        if (model != null) {
          OtpServices().sendOtp(model.email).then((value) {
            if (value != null) {
              final args = OtpArguementModel(
                  model: model, checkScreen: OtpScreenEnum.forgetOtpScreen);
              Navigator.of(context).pushNamed(
                RouteNames.optPage,
                arguments: args,
              );
              isLoading = false;
              notifyListeners();
            } else {
              isLoading = false;
              notifyListeners();
            }
          });
        } else {
          isLoading = false;
          notifyListeners();
          BazzToast.showToast('No user Found', Colors.red);
        }
      });
    }
  }

  String? findAccountTextfieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }
}
