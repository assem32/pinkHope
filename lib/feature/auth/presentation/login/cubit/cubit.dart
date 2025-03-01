import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/auth/domain/useCase/AuthUsecase.dart';
import 'package:breastnew/feature/auth/presentation/login/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  AuthUsecase authUsecase;

  LoginCubit(this.authUsecase) : super(LoginInit());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<UserModel> loginHandel(String email,String password) async {
   return await authUsecase.loginUseCase(email, password);
  }
}
