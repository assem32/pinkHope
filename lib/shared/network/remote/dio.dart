import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'http://192.168.43.80:8000/',
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> postImage({
    required String url,
     query,
  })
  async
  {
    return await dio!.post( url, data: query, );
  }
}