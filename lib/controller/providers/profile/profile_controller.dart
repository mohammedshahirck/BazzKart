import 'package:ecommerce/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogoutController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void logOut(BuildContext context) {
    storage.deleteAll();
    notifyListeners();
    Navigator.of(context).pushNamed(RouteNames.loginPage);
  }
}
