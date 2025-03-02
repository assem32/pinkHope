import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';
import 'package:breastnew/feature/drawer/domain/UseCase/GetMessagesUseCase.dart';
import 'package:breastnew/feature/drawer/domain/UseCase/SendMessageUseCase.dart';
import 'package:breastnew/feature/drawer/domain/repo/IDoctorsRepo.dart';
import 'package:breastnew/feature/drawer/presentation/chat/manger/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  SendMessageUsecase sendMessageUsecase;
  GetMessageUsecase getMessageUsecase;
  ChatCubit(this.sendMessageUsecase, this.getMessageUsecase)
    : super(ChatInit());

  static ChatCubit get(context) => BlocProvider.of(context);

  void sendMessage(String? reciverId, String message) {
    sendMessageUsecase.sendMessageUsecase(reciverId!, message);
    emit(SendMessageSuccessState());
  }

  List<MessageModel> messageList = [];
  Future<void> getMessage(String? reciverId) async {
    messageList = await getMessageUsecase.getMessageUsecase(reciverId);
    emit(GetChatSuccessState());
  }
}
