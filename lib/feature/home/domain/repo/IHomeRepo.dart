import 'dart:io';

abstract class IHomeRepo{
  Future <File?> pickImge();
  Future<dynamic> predict(data);
}