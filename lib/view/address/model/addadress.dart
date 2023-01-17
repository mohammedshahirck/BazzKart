import 'package:ecommerce/model/address/address_screen_enum.dart';

class AddNewAddressArguemnetModel {
  final String? addressId;
  final AddressScreenEnum addressScreenCheck;

  AddNewAddressArguemnetModel({
    required this.addressScreenCheck,
    this.addressId,
  });
}
