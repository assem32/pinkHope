import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/drawer/domain/repo/IDoctorsRepo.dart';

class GetDoctorsUsecase {
  IDoctorsRepo iDoctorsRepo;
  GetDoctorsUsecase(this.iDoctorsRepo);
  Future<List<UserModel> >getDoctorsUsecase()async{
    return await iDoctorsRepo.getDoctors();
  }
}