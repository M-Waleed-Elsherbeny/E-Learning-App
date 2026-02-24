import 'package:dio/dio.dart';
import 'package:e_learning_app/core/constants/api_constants.dart';

class DioService {
  Dio? dio;

  DioService() {
    initDio();
  }

  Future<void> initDio() async {
    if (dio != null) return;
    dio = Dio();
    dio!.options.baseUrl = ApiConstants.baseUrl;
    dio!.options.connectTimeout = const Duration(seconds: 30);
    dio!.options.receiveTimeout = const Duration(seconds: 30);
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio!.get(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio!.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
