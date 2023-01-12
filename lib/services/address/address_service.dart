import 'package:dio/dio.dart';
import 'package:ecommerce/constants/api_endpoints.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/model/address/add_address.dart';
import 'package:ecommerce/model/address/get_address.dart';
import 'package:ecommerce/utils/bazz_exception.dart';
import 'package:ecommerce/utils/dio_interceptor.dart';

class AddressService {
  Future<String?> addAddress(AddNewAddressModel model) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        MainUrls.baseUrl + ApiEndPoints.address,
        data: model.toJson(),
      );
      if (response.statusCode == 201) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<List<AddressModel>?> getAllAdress() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(MainUrls.baseUrl + ApiEndPoints.address);
      if (response.statusCode == 200) {
        final List<AddressModel> addressList = (response.data as List)
            .map((e) => AddressModel.fromJson(e))
            .toList();
        return addressList;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<String?> updateAddress(
      AddNewAddressModel model, String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.patch(
        "${MainUrls.baseUrl + ApiEndPoints.address}/$addressId",
        data: model.toJson(),
      );

      if (response.statusCode == 202) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }

  Future<String?> deleteAddress(String addressId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .delete("${MainUrls.baseUrl + ApiEndPoints.address}/$addressId");

      if (response.statusCode == 202) {
        final String result = response.data['message'];
        return result;
      }
    } catch (e) {
      BazzException.errorHandler(e);
    }
    return null;
  }
}
