import 'package:dio/dio.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = 'https://www.googleapis.com/books/v1/';
    dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      responseBody: true,
      requestBody: true,
      request: true,
      requestHeader: true,
      error: true,
    ));
  }

  @override
  Future delete(String path,
      {data,
      bool isFormData = false,
      Map<String, dynamic>? queryParameters}) async {
    final response = await dio.delete(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future get(String path, {data, Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future patch(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    final response = await dio.patch(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future post(String path,
      {data,
      bool isFormData = false,
      Map<String, dynamic>? queryParameters}) async {
    final response = await dio.post(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
