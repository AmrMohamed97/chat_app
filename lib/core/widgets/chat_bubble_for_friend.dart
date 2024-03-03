
import 'package:flutter/material.dart';

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key,required this.model});

  final dynamic model;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 8,),
        padding: const EdgeInsets.all(16),

        // constraints: const BoxConstraints(
        //   minHeight: 65,
        //   maxWidth: 200
        // ),
        decoration: const BoxDecoration(
          color: Color(0xff096685),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(32),
            topEnd: Radius.circular(32),
            bottomStart: Radius.circular(32),
          ),
        ),
        child: Text(
          model.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
