import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';

abstract class IDoctorsRepo {
  Future<List<UserModel>>getDoctors();
  void sendMessage(String? reciverId,String message);
  Future<List<MessageModel>>getMessages(String? reciverId);
}