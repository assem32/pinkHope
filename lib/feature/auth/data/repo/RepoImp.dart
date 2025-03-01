import 'package:breastnew/feature/auth/data/dataSource/remote.dart';
import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/auth/domain/repo/IRepo.dart';

class AuthReopImp extends IAuthRepo{
  RemoteDataSource remoteDataSource;
  AuthReopImp (this.remoteDataSource);

  @override
  Future<UserModel> login(String email, String password)async {
    return await remoteDataSource.login(email, password);
  }
  
  @override
  Future<UserModel> register(String name, String email, String password, String phone, String role)async {
    return await remoteDataSource.register(name, email, password, phone, role);
  }

}