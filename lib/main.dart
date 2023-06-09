
import 'package:breastcancer1/cubit/cubit.dart';
import 'package:breastcancer1/modules/chats/chat.dart';
import 'package:breastcancer1/modules/chats/cubit/cubit.dart';
import 'package:breastcancer1/modules/image.dart';
import 'package:breastcancer1/modules/login/cubit/cubit.dart';
import 'package:breastcancer1/modules/login/login_page.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:breastcancer1/shared/network/local/cache_helper.dart';
import 'package:breastcancer1/shared/network/remote/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding();
  DioHelper.init();
  Firebase.initializeApp();
  // uid=CacheHelper.getData(key: 'uid');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>PateintCubit()),
        BlocProvider(create: (BuildContext context)=>RegisterCubit()),
        BlocProvider(create: (BuildContext context)=>LoginCubit()),
        BlocProvider(create: (BuildContext context)=>ChatCubit()..getUsers()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xffce0058),
            titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white)
          ),
            scaffoldBackgroundColor: Colors.white,

        ),
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

