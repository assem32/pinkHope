import 'package:breastnew/feature/drawer/data/dataSource/remote/DoctorsRemote.dart';
import 'package:breastnew/feature/drawer/data/repo/DoctorsRepoImp.dart';
import 'package:breastnew/feature/drawer/domain/UseCase/GetDoctorsUseCase.dart';
import 'package:breastnew/feature/drawer/presentation/doctors/manger/cubit.dart';
import 'package:breastnew/feature/drawer/presentation/doctors/manger/state.dart';
import 'package:breastnew/feature/drawer/presentation/doctors/widget/DoctorsListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) =>
              DoctorsCubit(GetDoctorsUsecase(DoctorsRepoImp(DoctorsRemote())))
                ..getDoctors(),
      child: BlocBuilder<DoctorsCubit, DoctorsStates>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                if(state is GetDoctorsSuccessState)
                SingleChildScrollView(
                  child: DoctorsListView(DoctorsCubit.get(context).doctorsList,context)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
