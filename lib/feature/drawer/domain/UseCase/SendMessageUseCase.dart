import 'package:breastnew/feature/drawer/domain/repo/IDoctorsRepo.dart';

class SendMessageUsecase {
  IDoctorsRepo iDoctorsRepo;
  SendMessageUsecase(this.iDoctorsRepo);
  void sendMessageUsecase(String reciverId,String message){
    iDoctorsRepo.sendMessage(reciverId,message);
  }
}