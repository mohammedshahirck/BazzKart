import 'package:ecommerce/model/address/address_screen_enum.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/address/model/addadress.dart';
import 'package:flutter/cupertino.dart';

class AddressProvider with ChangeNotifier {
  String? addressId;
  bool loading = false;
  void toEditAddressScreen(BuildContext context,
      AddressScreenEnum addressScreenCheck, String addressId) {
    final args = AddNewAddressArguemnetModel(
        addressScreenCheck: addressScreenCheck, addressId: addressId);
    Navigator.of(context)
        .pushNamed(RouteNames.addNewAddressScreen, arguments: args);
  }
}
