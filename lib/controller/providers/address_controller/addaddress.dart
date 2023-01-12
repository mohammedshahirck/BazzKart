// import 'package:ecommerce/model/order_summery/order_summery.dart';
// import 'package:ecommerce/services/address/address_service.dart';
// import 'package:ecommerce/utils/api_base_url.dart';
// import 'package:flutter/material.dart';

// import '../../../routes/route_names.dart';

// class AddressProvider with ChangeNotifier {
//   String? addressId;
//   bool loading = false;

//   void toOrderSummaryScreen(context, OrderSummaryScreenEnum screenCheck,
//       String? productId, String? cartId) {
//     if (addressId == null) {
//       BazzToast.showToast('Select an address', Colors.red);
//     } else {
//       final args = OrderSummaryArguementModel(
//         addressId: addressId!,
//         screenCheck: screenCheck,
//         productId: productId,
//         cartId: cartId,
//       );
//       Navigator.of(context)
//           .pushNamed(RouteNames.orderSummaryScreen, arguments: args);
//     }
//   }

//   void toAddNewAddressScreen(context, AddressScreenEnum addressScreenCheck,
//       AddNewAddressProvider provider) async {
//     final args =
//         AddNewAddressArguemnetModel(addressScreenCheck: addressScreenCheck);
//     Navigator.of(context)
//         .pushNamed(RouteNames.addNewAddressScreen, arguments: args)
//         .then((value) {
//       provider.getAllAddresses().then((value) {
//         provider.addressChange(provider.addressList[0].id);
//         addressId = provider.addressList[0].id;
//       });
//     });
//   }

//   void toEditAddressScreen(
//       context, AddressScreenEnum addressScreenCheck, String addressId) {
//     final args = AddNewAddressArguemnetModel(
//         addressScreenCheck: addressScreenCheck, addressId: addressId);
//     Navigator.of(context)
//         .pushNamed(RouteNames.addNewAddressScreen, arguments: args);
//   }

//   void deleteAddress(String addressId) async {
//     loading = true;
//     notifyListeners();
//     await AddressService().deleteAddress(addressId).then((value) {
//       if (value != null) {
//         loading = false;
//         notifyListeners();
//       } else {
//         loading = false;
//         notifyListeners();
//       }
//     });
//   }
// }
