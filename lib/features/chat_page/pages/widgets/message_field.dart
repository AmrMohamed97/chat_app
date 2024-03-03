import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/features/chat_page/manager/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageField extends StatelessWidget {
  const MessageField({super.key, required this.context, this.email, required this.cubit});
  final BuildContext context;
  final Object? email;
  final ChatCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Send message',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (cubit.controller.text.isNotEmpty) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(data: cubit.controller.text, email: email);
                cubit.controller.clear();
                cubit.personalController.animateTo(
                  0,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeIn,
                );
              }
            },
            icon: const Icon(
              Icons.send,
              color: kPrimaryColor,
            ),
          ),
        ),
        controller: cubit.controller,
        onSubmitted: (data) {
          if (data.isNotEmpty) {
            BlocProvider.of<ChatCubit>(context)
                .sendMessage(data: data, email: email);
            cubit.controller.clear();
            cubit.personalController.animateTo(
              0,
              duration: const Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeIn,
            );
          }
        },
      ),
    );
  }
}
