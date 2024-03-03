import 'package:bloc/bloc.dart';
 import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/features/chat_page/manager/chat_state.dart';
 import 'package:chat_app/models/message.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatCubit extends Cubit<ChatStates>{
  ChatCubit():super(ChatInitialState());
  List<Message> messagesList=[];
  final personalController = ScrollController();
  final controller = TextEditingController();
  CollectionReference messages=FirebaseFirestore.instance.collection(kMessagesCollection);
  void sendMessage({required String data,required var email}){
    try {
      final addedMessage=Message(
        date: Timestamp.now(),
        id: email,
        message: data,
      );
      messages.add(
        addedMessage.toJson()
       );
    } on Exception catch (error) {
      print(error.toString());
    }
  }
  Future<void> getMessages()async {
    ChatLoading();
    try {
       messages.orderBy(kDate,descending: true).snapshots().listen((event) {
         messagesList=[];
        for (var element in event.docs) {
           messagesList.add(Message.fromJson(element.data()));
        }
         emit(ChatSuccess());
      });

    } on Exception catch (error) {
       ChatError(error);
    }
  }
}