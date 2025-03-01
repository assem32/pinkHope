import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/auth/domain/repo/IRepo.dart';

class AuthUsecase {
  IAuthRepo iAuthRepo;
  AuthUsecase(this.iAuthRepo);
  Future<UserModel> loginUseCase(String email,String password)async{
    return await iAuthRepo.login(email, password);
  }
  Future<UserModel> registerUserCase(
    String name,
    String email,
    String password,
    String phone,
    String role,
  )async{
    return await iAuthRepo.register(name, email, password, phone, role);
  }
}