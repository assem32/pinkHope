class MessageModel{
  String ?senderId;
  String ?message;
  String ?date;
  MessageModel({
    this.senderId,
    this.message,
    this.date
  }
      );
  MessageModel.fromJson(Map<dynamic,dynamic>json){
    senderId=json['senderId'];
    message=json['message'];
    date=json['date'];

  }
  Map<dynamic,dynamic>toMap(){
    return {
      'senderId':senderId,
      'message':message,
      'date':date,
    };
  }
}