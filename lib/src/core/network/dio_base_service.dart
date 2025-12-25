import 'package:dio/dio.dart';
import 'api_exception.dart';

class DioBaseService {
  late final Dio _dio;
  final String baseUrl;

  DioBaseService({required this.baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException err, handler) {
        handler.reject(_mapDioError(err));
      },
    ));
  }

  DioException _mapDioError(DioException err) {
    ApiException apiException;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      apiException = ConnectionException("Request Timeout");
    } else if (err.type == DioExceptionType.connectionError) {
      apiException = ConnectionException("No Internet Connection");
    } else if (err.type == DioExceptionType.badResponse) {
      final status = err.response?.statusCode ?? 0;
      switch (status) {
        case 400:
          apiException = BadRequestException(err.response?.data.toString());
          break;
        case 401:
          apiException = UnauthorisedException("Unauthorized");
          break;
        case 404:
          apiException = NotFoundException("Not Found");
          break;
        case 500:
          apiException = FetchDataException("Internal Server Error");
          break;
        default:
          apiException = BadResponseException(err.response?.data.toString());
      }
    } else {
      apiException = FetchDataException("Unexpected Error: ${err.message}");
    }

    return DioException(
      requestOptions: err.requestOptions,
      error: apiException,
    );
  }

  /// Generic GET
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      throw e.error ?? e;
    }
  }

  /// Generic POST
  Future<dynamic> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw e.error ?? e;
    }
  }

  /// Generic PUT
  Future<dynamic> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw e.error ?? e;
    }
  }

  /// Generic DELETE
  Future<dynamic> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw e.error ?? e;
    }
  }
}
