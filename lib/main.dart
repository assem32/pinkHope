import 'package:breastnew/feature/auth/data/dataSource/remote.dart';
import 'package:breastnew/feature/auth/data/repo/RepoImp.dart' show AuthReopImp;
import 'package:breastnew/feature/auth/domain/useCase/AuthUsecase.dart';
import 'package:breastnew/feature/auth/presentation/login/cubit/cubit.dart';
import 'package:breastnew/feature/auth/presentation/login/login_page.dart';
import 'package:breastnew/feature/auth/presentation/register/cubit/cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>LoginCubit(
          AuthUsecase(
            AuthReopImp(
              RemoteDataSource()
            )
          )
        )),
        BlocProvider(create: (BuildContext context)=>RegisterCubit(
          AuthUsecase(
            AuthReopImp(
              RemoteDataSource()
            )
          )
        )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginPage(),
      ),
    );
  }
}
