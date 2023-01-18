import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/address/address_screen.dart';
import 'package:ecommerce/view/address/model/addadress.dart';
import 'package:ecommerce/view/address_view/address_view.dart';
import 'package:ecommerce/view/forget_password/forget_password_screen.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:ecommerce/view/login/login_page.dart';
import 'package:ecommerce/view/my_bag/my_bag.dart';
import 'package:ecommerce/view/otp_screen/otp_screen.dart';
import 'package:ecommerce/view/reset_password/model/reset_password_model.dart';
import 'package:ecommerce/view/reset_password/reset_password.dart';
import 'package:ecommerce/view/signup/singn_up.dart';
import 'package:ecommerce/view/signup/widget/otp_screen_argument.dart';
import 'package:ecommerce/view/splash/splash.dart';
import 'package:ecommerce/widgets/bottom_nav.dart';
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
          builder: (context) => const LoginPage(),
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
      case RouteNames.cartpage:
        return MaterialPageRoute(
          builder: (context) => const MyBag(),
        );

      case RouteNames.bottomNav:
        return MaterialPageRoute(
          builder: (context) => const BottomNav(),
        );
      case RouteNames.cartpage:
        return MaterialPageRoute(
          builder: (context) => const MyBag(),
        );
      case RouteNames.addNewAddressScreen:
        final args = settings.arguments as AddNewAddressArguemnetModel;
        return MaterialPageRoute(
          builder: (context) => AddAddressScreen(
            addressScreenCheck: args.addressScreenCheck,
            addressid: args.addressId,
          ),
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
