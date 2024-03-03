import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key,required this.model});

  final dynamic model;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 8,),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(32),
            topEnd: Radius.circular(32),
            bottomEnd: Radius.circular(32),
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
