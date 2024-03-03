import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/features/chat_page/manager/chat_cubit.dart';
import 'package:chat_app/features/chat_page/manager/chat_state.dart';
import 'package:chat_app/features/chat_page/pages/widgets/message_body.dart';
import 'package:chat_app/features/chat_page/pages/widgets/message_field.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return BlocBuilder<ChatCubit,ChatStates>(builder: (context,state){
      var cubit=BlocProvider.of<ChatCubit>(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff314B62),
          automaticallyImplyLeading: false,
          title: _title(),
        ),
        body: Column(children: [
          MessageBody(cubit: cubit,email:email),
          MessageField(context: context,email: email,cubit:cubit ),
        ]),
      );
    });

  }
  Row _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          kLogo,
          height: 50,
          width: 50,
        ),
        const Text(
          'Chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
