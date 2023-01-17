import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/account/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogoutController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool loading = false;

  void logOut(context) async {
    loading = true;
    notifyListeners();
    AccountService().logOutUser().then((value) async {
      if (value != null) {
        await storage.delete(key: 'token');
        await storage.delete(key: 'refreshToken');
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.loginPage, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
