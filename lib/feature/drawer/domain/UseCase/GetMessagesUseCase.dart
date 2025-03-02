import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';
import 'package:breastnew/feature/drawer/domain/repo/IDoctorsRepo.dart';

class GetMessageUsecase {
  IDoctorsRepo iDoctorsRepo;
  GetMessageUsecase(this.iDoctorsRepo);
  Future<List<MessageModel>> getMessageUsecase(String? reciverId)async{
    return await iDoctorsRepo.getMessages(reciverId);
  }
}