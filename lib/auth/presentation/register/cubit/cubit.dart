
import 'package:breastnew/auth/data/models/UserModel.dart';
import 'package:breastnew/auth/domain/useCase/AuthUsecase.dart';
import 'package:breastnew/auth/presentation/login/cubit/cubit.dart';
import 'package:breastnew/auth/presentation/register/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
