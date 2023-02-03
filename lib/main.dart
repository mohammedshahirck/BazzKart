import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/address_controller/addaddress.dart';
import 'package:ecommerce/controller/providers/bottom_nav/bottom_nav.dart';
import 'package:ecommerce/controller/providers/cart/cart_controller.dart';
import 'package:ecommerce/controller/providers/forget/forget_controller.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/controller/providers/login/login_controller.dart';
import 'package:ecommerce/controller/providers/order/order_control.dart';
import 'package:ecommerce/controller/providers/order_details/order_details_controller.dart';
import 'package:ecommerce/controller/providers/otp/otp_controller.dart';
import 'package:ecommerce/controller/providers/payment/payment_controller.dart';
import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/controller/providers/signup/singnup_controller.dart';
import 'package:ecommerce/controller/providers/splash/splash.dart';
import 'package:ecommerce/controller/providers/wishlist/wishlist.dart';
import 'package:ecommerce/routes/route_function.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:ecommerce/view/detail_page/detail_page.dart';
import 'package:ecommerce/view/splash/splash.dart';
import 'package:ecommerce/view/wishlist/wishlist.dart';
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
          create: (context) => ProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderSummaryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          useMaterial3: false,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.grey)
              .copyWith(error: Colors.red),
        ),
        onGenerateRoute: (settings) => PageRouts.generateRoute(settings),
        home: const SplashScreen(),
        routes: {
          ProductDetailPage.routeNames: (context) => const ProductDetailPage(),
          Categorys.catRoute: (context) => const Categorys(),
          Favorites.wishList: (context) => const Favorites(),
        },
      ),
    );
  }
}
