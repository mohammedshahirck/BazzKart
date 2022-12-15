import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/forget_password/forget_password_screen.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:ecommerce/view/login/login_page.dart';
import 'package:ecommerce/view/otp_screen/otp_screen.dart';
import 'package:ecommerce/view/reset_password/model/reset_password_model.dart';
import 'package:ecommerce/view/reset_password/reset_password.dart';
import 'package:ecommerce/view/signup/singn_up.dart';
import 'package:ecommerce/view/signup/widget/otp_screen_argument.dart';
import 'package:ecommerce/view/splash/splash.dart';
import 'package:flutter/material.dart';

class PageRouts {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.loginPage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case RouteNames.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case RouteNames.signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case RouteNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case RouteNames.resetPassword:
        final args = settings.arguments as ResetPasswordArguementsModel;
        return MaterialPageRoute(
          builder: (context) => ResetPassWord(model: args.model),
        );
      case RouteNames.optPage:
        final args = settings.arguments as OtpArguementModel;
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            model: args.model,
            screenCheck: args.checkScreen,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
