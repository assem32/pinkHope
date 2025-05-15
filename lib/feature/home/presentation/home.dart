import 'dart:io';

import 'package:breastnew/core/Api.dart';
import 'package:breastnew/feature/drawer/presentation/drawer/DrawerMain.dart';
import 'package:breastnew/feature/home/data/dataSource/local/imageDataSource.dart';
import 'package:breastnew/feature/home/data/dataSource/remote/remote.dart';
import 'package:breastnew/feature/home/data/repo/HomeRepoImp.dart';
import 'package:breastnew/feature/home/domain/useCase/HomeUseCase.dart';
import 'package:breastnew/feature/home/domain/useCase/PredictionUseCase.dart';
import 'package:breastnew/feature/home/presentation/manger/cubit.dart';
import 'package:breastnew/feature/home/presentation/manger/state.dart';
import 'package:breastnew/feature/home/presentation/widgets/Bottom.dart';
import 'package:breastnew/feature/home/presentation/widgets/SwipeImage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String? res;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) => HomeCubit(
            PickImageUsecase(
              HomeRepoImpl(ImageDataSource(), Remote(ApiService(Dio()))),
            ),
            PredictionUsecase(
              HomeRepoImpl(ImageDataSource(), Remote(ApiService(Dio()))),
            ),
          ),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Scaffold(
            drawer: DrawerMain(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color(0xffce0058),
              title: Row(
                children: [
                  Image.asset('assets/splash.png', width: 25, height: 40),
                  SizedBox(width: 20),
                  Text('Home', style: TextStyle(color: Colors.white)),
                ],
              ),
              actions: [],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      Swipeimage(),
                      SizedBox(height: 20),
                      Material(
                        borderRadius: BorderRadius.circular(26),
                        color: Color(0xffF386A5),
                        child: MaterialButton(
                          onPressed: () async {
                            await HomeCubit.get(context).imagePickedUsecase();
                          },
                          child: const Text('Select Image'),
                        ),
                      ),
                      if (HomeCubit.get(context).img != null)
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.file(
                            File(HomeCubit.get(context).img.path),
                          ),
                        ),
                      MaterialButton(
                        onPressed: () async {
                          FormData formData = FormData.fromMap({
                            'image': await MultipartFile.fromFile(
                              HomeCubit.get(context).img.path,
                              filename:
                                  HomeCubit.get(
                                    context,
                                  ).img.path.split('/').last,
                            ),
                          });
                          res = await HomeCubit.get(
                            context,
                          ).predictUsecase(formData);
                        },
                        child: Text('predict'),
                      ),
                      if (res != null) Text(res!),
                      SizedBox(height: 20),
                      BottomScreen(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
