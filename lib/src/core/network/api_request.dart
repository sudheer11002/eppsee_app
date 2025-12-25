import 'package:dio/dio.dart';

enum RequestType { post, get, delete, put }

enum BodyType { formData, raw, json, multipart }

class ApiRequest {
  final String url;
  final RequestType requestType;
  final Map<String, dynamic>? headers;
  final dynamic body;
  final BodyType bodyType;
  final bool sendBearerToken;
  final CancelToken? cancelToken;

  ApiRequest({
    required this.url,
    required this.requestType,
    this.headers,
    this.body,
    this.sendBearerToken = true,
    this.bodyType = BodyType.json,
    this.cancelToken, // Default to formData
  });
}
