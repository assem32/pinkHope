import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/drawer/data/dataSource/remote/DoctorsRemote.dart';
import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';
import 'package:breastnew/feature/drawer/domain/repo/IDoctorsRepo.dart';

class DoctorsRepoImp extends IDoctorsRepo{
  DoctorsRemote doctorsRemote;
  DoctorsRepoImp(this.doctorsRemote);
  @override
  Future<List<UserModel>> getDoctors()async {
    return await doctorsRemote.getDoctors();
  }

  @override
  Future<List<MessageModel>> getMessages(String? reciverId) async{
    return await doctorsRemote.getMessage(reciverId);
  }

  @override
  void sendMessage(String? reciverId,String message ) {
    doctorsRemote.sendMessages(reciverId, message);
  }
}