// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:ecommerce/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? signInstate;
  void checkLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    signInstate = await storage.read(key: 'token');
    log(signInstate.toString());
    if (signInstate != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNav, (route) => false);
    } else {
      await Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.loginPage, (route) => false);
    }
  }
}
