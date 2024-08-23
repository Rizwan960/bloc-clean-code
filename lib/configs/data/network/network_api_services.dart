import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_template/configs/Data/exception/app_exception.dart';
import 'package:bloc_template/configs/data/network/base_api_services.dart';
import 'package:bloc_template/configs/storage/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/// Class for handling network API requests.
class NetworkApiService implements BaseApiServices {
  /// Sends a GET request to the specified [url] and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.

  Future<Map<String, String>> _getHeaders() async {
    LocalStorage prefs = LocalStorage();
    var token = prefs.readValue('token');
    return {
      'Accept': 'application/json',
      'Device-Id': await cGetDeviceId(),
      'Device-Type': Platform.isAndroid ? 'Android' : 'iOS',
      'Authorization': 'Bearer $token',
    };
  }

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final headers = await _getHeaders();
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Sends a DELETE request to the specified [url] and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> deleteApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final headers = await _getHeaders();

      final response = await http
          .delete(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Sends a POST request to the specified [url] with the provided [data]
  /// and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final headers = await _getHeaders();

      final Response response =
          await post(Uri.parse(url), body: data, headers: headers)
              .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Parses the [response] and returns the corresponding JSON data.
  ///
  /// Throws a [FetchDataException] with the appropriate error message if the response status code is not successful.
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
