import 'dart:async';
import 'dart:developer';
import 'package:ecommerce/model/otp_enum_screen/otp_screen_enum.dart';
import 'package:ecommerce/model/signup_model/sign_up_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/otp/otp_service.dart';
import 'package:ecommerce/services/signup/signup_services.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:ecommerce/view/reset_password/model/reset_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OtpController extends ChangeNotifier {
  int timeRemaining = 60;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';
  bool loading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void setResendVisibility(bool newValue, context, String email) {
    log('');
    clear = true;
    notifyListeners();
    OtpServices().sendOtp(email).then((value) {
      if (value != null) {
        clear = false;
        notifyListeners();
        enableResend = newValue;
        timeRemaining = 60;
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyCode(context, SignUpModel model, OtpScreenEnum screenChek) async {
    if (code.length != 4) {
      BazzToast.showToast('Please enter OTP', Colors.grey);
    } else {
      if (timeRemaining == 0) {
        BazzToast.showToast('Otp timedout', Colors.grey);
      } else {
        loading = true;
        notifyListeners();
        if (screenChek == OtpScreenEnum.forgetOtpScreen) {
          await OtpServices().verifyOtp(model.email, code).then((value) {
            if (value != null) {
              final args = ResetPasswordArguementsModel(model: model);
              Navigator.of(context)
                  .pushReplacementNamed(RouteNames.resetPassword,
                      arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
          await OtpServices().verifyOtp(model.email, code).then((value) async {
            if (value != null) {
              await SignUpService()
                  .signUpService(model, context)
                  .then((value) async {
                if (value != null) {
                  await storage.write(key: 'token', value: value.accessToken);
                  await storage.write(
                      key: 'refreshToken', value: value.refreshToken);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.homePage, (route) => false);
                  loading = false;
                  notifyListeners();
                } else {
                  loading = false;
                  notifyListeners();
                }
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        }
      }
    }
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }
}
