import 'package:ecommerce/model/address/add_address.dart';
import 'package:ecommerce/model/address/get_address.dart';
import 'package:ecommerce/services/address/address_service.dart';
import 'package:flutter/material.dart';

import '../../../model/address/address_screen_enum.dart';

class AddressController extends ChangeNotifier {
  AddressController() {
    getAllAddress();
  }
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
  int selectIndex = 0;

  AddressModel? singleAddress;
  String title = 'ADD NEW ADDRESS';
  String title2 = 'UPDATE YOUR ADDRESS';

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

  void addressSelect(int index) {
    selectIndex = index;
    notifyListeners();
  }

  String? tiTle(AddressScreenEnum addressScreenChecK) {
    if (addressScreenChecK == AddressScreenEnum.addAddressScreen) {
      title;
      notifyListeners();
    } else {
      title2;
      notifyListeners();
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

  void saveAddress(FormState currentState, BuildContext context,
      AddressScreenEnum addressScreenCheck, String? addressId) {
    if (currentState.validate()) {
      if (addressScreenCheck == AddressScreenEnum.addAddressScreen) {
        addNewAddress(context);
      } else {
        updateAddress(context, addressId!);
      }
    }
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
        getAllAddress();
        isLoading2 = false;
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
  }

  void deleteAddress(String addressId) async {
    notifyListeners();
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

  void getSingleAddress(String addressId) async {
    isLoading = true;
    notifyListeners();
    await AddressService().getSingleAddress(addressId).then((value) {
      if (value != null) {
        singleAddress = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void setAddressScreen(
      AddressScreenEnum addressScreenCheck, String? addressId) async {
    if (addressScreenCheck == AddressScreenEnum.addAddressScreen) {
      clearControllers();
    } else {
      await AddressService().getSingleAddress(addressId!).then((value) {
        notifyListeners();
        if (value != null) {
          namecontroller.text = value.fullName;
          localityTown.text = value.landMark;
          pinCodeController.text = value.pin;
          stateNameController.text = value.state;
          phoneNumberController.text = value.phone;
          placeController.text = localityTown.text = value.place;
          homeAddressName.text = value.address;
          notifyListeners();
          value.title == 'Home' ? homeselect = true : homeselect = false;
          notifyListeners();
        }
      });
    }
  }
}
