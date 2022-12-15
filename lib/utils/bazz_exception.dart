import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce/utils/api_base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BazzException {
  static void errorHandler(Object e) {
    if (e is PlatformException) {
      BazzToast.showToast('Platform Error Occured', Colors.red);
    }
    if (e is SocketException) {
      BazzToast.showToast('No Internet Connection', Colors.red);
    } else if (e is TimeoutException) {
      BazzToast.showToast('Connection Timeout', Colors.grey);
    } else if (e is MissingPluginException) {
      BazzToast.showToast('Pluggin error occured', Colors.grey);
    } else if (e is DioError) {
      if (e.response?.data['message'] != null) {
        BazzToast.showToast(
            e.response!.data['message'].toString(), Colors.grey);
      } else if (e.type == DioErrorType.connectTimeout) {
        BazzToast.showToast('Connection timedout', Colors.grey);
      } else if (e.type == DioErrorType.receiveTimeout) {
        BazzToast.showToast('Response timedout', Colors.grey);
      } else if (e.type == DioErrorType.cancel) {
        BazzToast.showToast('Request cancelled', Colors.grey);
      } else if (e.type == DioErrorType.sendTimeout) {
        BazzToast.showToast('Request timedout', Colors.grey);
      } else if (e.error is SocketException) {
        BazzToast.showToast('No Internet Connection', Colors.grey);
      } else if (e.type == DioErrorType.other) {
        BazzToast.showToast('Something went wrong', Colors.grey);
      }
    }
  }
}
