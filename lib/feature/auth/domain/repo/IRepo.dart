import 'package:breastnew/feature/auth/data/models/UserModel.dart';

abstract class IAuthRepo {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(
    String name,
    String email,
    String password,
    String phone,
    String role,
  );
}
