class ChatModel{
  String ?senderId;
  String ?receiverId;
  String ?message;
  String ?date;
  ChatModel({this.senderId,
    this.receiverId,
    this.message,
    this.date
  }
      );
  ChatModel.fromJson(Map<String,dynamic>json){
    senderId=json['senderId'];
    receiverId=json['receiverId'];
    message=json['message'];
    date=json['date'];

  }
  Map<String,dynamic>toMap(){
    return {
      'senderId':senderId,
      'receiverId':receiverId,
      'message':message,
      'date':date,
    };
  }
}