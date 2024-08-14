import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "https://dummyjson.com/";
  ApiService(this._dio);

  Future<List<String>> getCategory({required String endPoint}) async {
    final result = await _dio.get("$baseUrl$endPoint");

    return (result.data as List<dynamic>).cast<String>();
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final result = await _dio.get("$baseUrl$endPoint");
    return result.data;
  }
}
