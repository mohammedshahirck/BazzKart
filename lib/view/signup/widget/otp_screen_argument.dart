import 'package:ecommerce/model/otp_enum_screen/otp_screen_enum.dart';
import 'package:ecommerce/model/signup_model/sign_up_model.dart';

class OtpArguementModel {
  final SignUpModel model;
  final OtpScreenEnum checkScreen;
  OtpArguementModel({
    required this.model,
    required this.checkScreen,
  });
}
