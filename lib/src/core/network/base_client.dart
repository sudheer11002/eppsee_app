import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:eppsee/src/core/error/error_response.dart';

import '../../utils/app_utils.dart';
import '../di/service_locator.dart';
import '../helpers/shared_pref_const.dart';
import '../helpers/shared_preferences.dart';
import 'api_exception.dart';
import 'dart:async';

abstract class DioBaseService {
  late Dio _dioClient;
  late String _baseUrl;
  late Map<String, dynamic> _headers;
  final SharedPreferencesService sharedPrefs = getIt.get<SharedPreferencesService>();

  DioBaseService(String baseUrl) {
    _baseUrl = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    _headers = getHeader();
    _createClient();
  }

  @protected
  Map<String, dynamic> getHeader() {
    String token = sharedPrefs.getString(SharedPrefConstants.authToken, defaultValue: '');

    if (token.isNotEmpty) {
      return {
        "Content-Type": "application/json",
        // "institutionid": "1",
        "Authorization": "Bearer $token",
        // "device_id": DeviceInfoService.instance.deviceInfo['device_id'] ?? '',
        // "device_token": sharedPrefs.getString('device_token', defaultValue: ''),
        // "app_version": DeviceInfoService.instance.deviceInfo['app_version'] ?? ''
      };
    }
    return {
      "Content-Type": "application/json",
      // "institutionid": "1",
      // "Authorization":
      //     "Bearer ${sharedPrefs.getString('auth_token', defaultValue: '')}" ??
      //         "",
      // "device_id": DeviceInfoService.instance.deviceInfo['device_id'] ?? '',
      // "device_token": sharedPrefs.getString('device_token', defaultValue: ''),
      // "app_version": DeviceInfoService.instance.deviceInfo['app_version'] ?? ''
    };
  }

  void _createClient() {
    _dioClient = Dio();
    _dioClient.options
      ..baseUrl = _baseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..sendTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..headers = _headers
      ..responseType = ResponseType.plain;

    _dioClient.interceptors.add(LogInterceptor(
        requestBody: true, responseHeader: false, responseBody: true, request: false));
  }

  @protected
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? headers}) async {
    try {
      // final HttpMetric metric =
      //     FirebasePerformance.instance.newHttpMetric(path, HttpMethod.Get);
      // await metric.start();
      Response response = await _dioClient.get(path,
          queryParameters: queryParams, options: Options(headers: headers));
      // metric.httpResponseCode = response.statusCode;
      // await metric.stop();

      return _responseHandler(response);
    } on DioException catch (dioError) {
      _errorHandler(dioError);
    }
  }

  @protected
  Future<dynamic> post(String path, Map<String, dynamic> data,
      {Map<String, dynamic>? headers}) async {
    try {
      // final HttpMetric metric =
      //     FirebasePerformance.instance.newHttpMetric(path, HttpMethod.Post);
      // await metric.start();
      Response response = await _dioClient.post(path,
          data: FormData.fromMap(data), options: Options(headers: headers));
      // metric.httpResponseCode = response.statusCode;
      // await metric.stop();
      return _responseHandler(response);
    } on DioException catch (dioError) {
      _errorHandler(dioError);
    }
  }

  @protected
  Future<dynamic> postJson(String path, var json, {Map<String, dynamic>? headers}) async {
    try {
      // final HttpMetric metric =
      //     FirebasePerformance.instance.newHttpMetric(path, HttpMethod.Post);
      // await metric.start();
      Response response =
          await _dioClient.post(path, data: json, options: Options(headers: headers));
      // metric.httpResponseCode = response.statusCode;
      // await metric.stop();
      return _responseHandler(response);
    } on DioException catch (dioError) {
      _errorHandler(dioError);
    }
  }

  @protected
  Future<dynamic> put(String path, Map<String, dynamic> data,
      {Map<String, dynamic>? headers}) async {
    try {
      Response response =
          await _dioClient.put(path, data: data, options: Options(headers: headers));
      return _responseHandler(response);
    } on DioException catch (dioError) {
      _errorHandler(dioError);
    }
  }

  @protected
  Future<dynamic> delete(String path, Map<String, dynamic> data) async {
    try {
      Response response = await _dioClient.delete(path, data: data);
      return _responseHandler(response);
    } on DioException catch (dioError) {
      _errorHandler(dioError);
    }
  }

  void _errorHandler(DioException error) {
    print('----_errorHandler----$error');
    _errorStatus(error);
    DioExceptionType dioExceptionType = error.type;
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        throw ConnectionException('connection time out');
      case DioExceptionType.sendTimeout:
        throw ConnectionException('request time out');
      case DioExceptionType.receiveTimeout:
        throw ConnectionException('response time out');
      case DioExceptionType.badResponse:
        throw ConnectionException('bad Response');
      case DioExceptionType.badCertificate:
        //_errorStatus(error.response);
        throw ConnectionException('bad Certificate');
      //break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (error is SocketException) {
          throw FetchDataException('Socket');
        }
        throw FetchDataException('No internet connection');
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw ConnectionException('connection Error');
      default:
        throw FetchDataException('Error occured while Communication with Server $error');
    }
  }

  dynamic _responseHandler(Response response) {
    //print('----f_responseHandler----f =${response}');
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 203:
        if (response.data == null || response.data.isEmpty) {
          throw EmptyResultApiException();
        }
        return response.data;
    }
  }

  void _errorStatus(DioException dioException) {
    switch (dioException.response?.statusCode) {
      case 400:
        AppUtils.showToast(jsonDecode(dioException.response?.data.toString() ?? "")["message"]);
        throw BadRequestException(dioException.response?.data?.toString());
      case 401:
        final errorResponse = errorResponseFromJson(dioException.response?.data);
        AppUtils.showToast(jsonDecode(dioException.response?.data.toString() ?? "")["message"]);

        throw BadResponseException(errorResponse);
      case 403:
        AppUtils.showToast(jsonDecode(dioException.response?.data.toString() ?? "")["message"]);
        throw UnauthorisedException(dioException.response?.data?.toString());
      case 404:
        AppUtils.showToast(jsonDecode(dioException.response?.data.toString() ?? "")["message"]);
        throw NotFoundException(dioException.response?.data?.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${dioException.response?.statusCode}');
    }
  }
}
