import 'package:breastnew/auth/data/models/UserModel.dart';
import 'package:breastnew/auth/domain/useCase/AuthUsecase.dart';
import 'package:breastnew/auth/presentation/login/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  AuthUsecase authUsecase;

  LoginCubit(this.authUsecase) : super(LoginInit());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<UserModel> loginHandel(String email,String password) async {
    print('dd');
   return await authUsecase.loginUseCase(email, password);
  }
}
