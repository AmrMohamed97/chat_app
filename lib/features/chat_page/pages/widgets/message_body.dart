
import 'package:chat_app/core/widgets/chat_bubble.dart';
import 'package:chat_app/core/widgets/chat_bubble_for_friend.dart';
import 'package:chat_app/features/chat_page/manager/chat_cubit.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({super.key, this.email, required this.cubit});
  final Object? email;
  final ChatCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child:ListView.builder(
            reverse: true,
            controller: cubit.personalController,
            // physics: const BouncingScrollPhysics(),
            itemCount:
            BlocProvider.of<ChatCubit>(context).messagesList.length,
            itemBuilder: (context, index) =>
            BlocProvider.of<ChatCubit>(context)
                .messagesList[index]
                .id ==
                email
                ? ChatBubble(
                model: BlocProvider.of<ChatCubit>(context)
                    .messagesList[index])
                : ChatBubbleForFriend(
              model: BlocProvider.of<ChatCubit>(context)
                  .messagesList[index],
            ),
          ),

    );
  }
}
