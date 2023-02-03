import 'package:ecommerce/model/user_model/user_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/account/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool loading = false;
  bool isLoading = false;
  UserModel? userModel;

  void getUser() async {
    isLoading = true;
    notifyListeners();
    final email = await storage.read(key: 'email');
    await AccountService().getUserDetails(email.toString()).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
        userModel = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

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
