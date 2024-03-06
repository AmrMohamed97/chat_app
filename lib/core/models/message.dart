
 import 'package:chat_app/core/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  late String id;
  late Timestamp date;
  late String message;
  Message({required this.message,required this.id,required this.date});
  factory Message.fromJson(json){
    return Message(id: json['id'], message: json[kMessage],date:json['date'] ,);
  }
  factory Message.empty(){
    return Message(
      date: Timestamp.now(),
      message:'',
      id:'',
    );
  }
  Message copyWith({String? id,String? message,Timestamp? date}){
    return Message(
      date: date?? this.date,
      message: message?? this.message,
      id: id?? this.id,
    );
  }
  Map<String,dynamic> toJson(){
    return {
    'message':message ,
    'id':id ,
      'date':date,
  };
  }
}