import 'package:dio/dio.dart';

class ApiServices {
  Dio? dio;
  ApiServices(this.dio);
  Future<Response> get({required String endPoint}) async {
    return await dio!.get(endPoint);
  }

  Future<Response> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    return await dio!.post(endPoint, data: data);
  }
}
