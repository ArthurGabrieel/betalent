import 'package:betalent/core/api/endpoints.dart';
import 'package:betalent/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class HttpClient {
  HttpClient(this.dio) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  final Dio dio;

  Future<Response> get(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    try {
      return await dio.get(endpoint, queryParameters: queryParams);
    } on DioException {
      throw ServerException();
    }
  }
}
