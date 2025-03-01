import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/auth/domain/useCase/AuthUsecase.dart';
import 'package:breastnew/feature/auth/presentation/register/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var uid;

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.authUsecase) : super(RegisterInit());

  static RegisterCubit get(context) => BlocProvider.of(context);

  AuthUsecase authUsecase;

  Future<UserModel> registerUserCase(
    String name,
    String email,
    String password,
    String phone,
    String role,
  )async{
   var model = await authUsecase.registerUserCase(name, email, password, phone, role);
   emit(RegisterUserSuccessState());
   return model;
  }
  
}
