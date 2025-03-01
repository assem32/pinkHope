import 'package:breastnew/feature/home/domain/repo/IHomeRepo.dart';

class PredictionUsecase{
  IHomeRepo iHomeRepo;
  PredictionUsecase(this.iHomeRepo);
  

  Future <dynamic>predict(data)async{
    return await iHomeRepo.predict(data);
  }
}