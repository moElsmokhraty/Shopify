import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token
    };
    var response =
        await _dio.post(endpoint, data: data, queryParameters: query ?? {});
    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token
    };
    var response =
        await _dio.get(endpoint, data: data, queryParameters: query ?? {});
    return response.data;
  }
}
