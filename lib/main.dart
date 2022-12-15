import 'package:ecommerce/controller/providers/forget/forget_controller.dart';
import 'package:ecommerce/controller/providers/login/login_controller.dart';
import 'package:ecommerce/controller/providers/otp/otp_controller.dart';
import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/controller/providers/signup/singnup_controller.dart';
import 'package:ecommerce/controller/providers/splash.dart';
import 'package:ecommerce/routes/route_function.dart';
import 'package:ecommerce/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgetController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogoutController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
          // primaryColor: Colors.black,
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.grey),
          errorColor: Colors.red,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        onGenerateRoute: (settings) => PageRouts.generateRoute(settings),
        home:
            //  ForgetPassword(),
            const SplashScreen(),
      ),
    );
  }
}
