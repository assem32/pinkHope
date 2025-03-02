import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/drawer/domain/UseCase/GetDoctorsUseCase.dart';
import 'package:breastnew/feature/drawer/presentation/doctors/manger/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  GetDoctorsUsecase getDoctorsUsecase;

  DoctorsCubit(this.getDoctorsUsecase) : super(DoctorsInit());

  static DoctorsCubit get(context) => BlocProvider.of(context);
  
  List<UserModel>doctorsList=[];

  Future<void> getDoctors() async{
    doctorsList=await getDoctorsUsecase.getDoctorsUsecase();
    emit(GetDoctorsSuccessState());
  }
  }