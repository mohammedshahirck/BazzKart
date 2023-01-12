import 'package:ecommerce/model/address/add_address.dart';
import 'package:ecommerce/model/address/get_address.dart';
import 'package:ecommerce/services/address/address_service.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:flutter/material.dart';

class AddressController extends ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController stateNameController = TextEditingController();
  final TextEditingController homeAddressName = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController localityTown = TextEditingController();
  bool isLoading = false;
  bool isLoading2 = false;
  bool homeselect = true;
  List<AddressModel> addressList = [];
  AddNewAddressModel? address;
  String addressType = 'Home';
  String? addressGroupValue = 'address1';

  String? nameHouseandAreaValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length != 10) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  String? pinValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your pincode';
    } else if (value.length != 6) {
      return 'Please enter valid pincode';
    }
    return null;
  }

  void selectAddressType() {
    homeselect = !homeselect;
    notifyListeners();
    homeselect == true ? addressType = 'Home' : addressType = 'Office';
    notifyListeners();
  }

  void addNewAddress(BuildContext context) async {
    isLoading2 = true;
    notifyListeners();
    final AddNewAddressModel model = AddNewAddressModel(
      addressType: addressType,
      name: namecontroller.text,
      contactNumber: phoneNumberController.text,
      pinCode: pinCodeController.text,
      state: stateNameController.text,
      place: placeController.text,
      address: homeAddressName.text,
      areaColony: localityTown.text,
    );
    await AddressService().addAddress(model).then((value) {
      if (value != null) {
        clearControllers();
        Navigator.of(context).pop();
        isLoading2 = false;
        getAllAddress();
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
  }

  void saveAddress(FormState currentState, BuildContext context) {
    if (currentState.validate()) {
      addNewAddress(context);
    }
    BazzToast.showToast('Address Add', Colors.grey);
  }

  Future<String?> getAllAddress() async {
    isLoading = true;
    notifyListeners();
    await AddressService().getAllAdress().then((value) {
      if (value != null) {
        addressList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
        return 'set';
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    });
    return null;
  }

  void clearControllers() {
    namecontroller.clear();
    pinCodeController.clear();
    stateNameController.clear();
    homeAddressName.clear();
    placeController.clear();
    localityTown.clear();
    phoneNumberController.clear();
    addressType = 'Home';
  }

  void updateAddress(BuildContext context, String addressId) async {
    isLoading2 = true;
    notifyListeners();
    final AddNewAddressModel model = AddNewAddressModel(
      addressType: addressType,
      name: namecontroller.text,
      contactNumber: phoneNumberController.text,
      pinCode: pinCodeController.text,
      state: stateNameController.text,
      place: placeController.text,
      address: homeAddressName.text,
      areaColony: localityTown.text,
    );
    await AddressService().updateAddress(model, addressId).then((value) {
      if (value != null) {
        clearControllers();
        Navigator.of(context).pop();
        isLoading2 = false;
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
  }

  void deleteAddress(String addressId) async {
    isLoading = true;
    notifyListeners();
    await AddressService().deleteAddress(addressId).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
