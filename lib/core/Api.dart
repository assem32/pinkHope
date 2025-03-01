import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl='http://10.0.2.2:8000/';//working locally
  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> post({required String endPoint,data})async{
    var response = await dio.post(_baseUrl+endPoint,data: data);
    return response.data;
  }
}