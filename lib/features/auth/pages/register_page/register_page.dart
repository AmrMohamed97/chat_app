import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/widgets/show_snack_bar.dart';
import 'package:chat_app/features/auth/manager/auth_cubit.dart';
import 'package:chat_app/features/auth/manager/auth_state.dart';
import 'package:chat_app/features/auth/pages/register_page/widgets/register_body.dart';
import 'package:chat_app/features/chat_page/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static String id='RegisterPage';
  @override
  Widget build(BuildContext context) {
    var cubit=BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
        if(state is RegisterSuccess){
          showSnackBar(context, message: 'Login Success',);
          Navigator.pushNamed(context, ChatPage.id,arguments: cubit.email);
          BlocProvider.of<AuthCubit>(context).changeLoad(load: false);
        }
        if (state is RegisterError) {
          if(state.error.code=='weak-password'){
            showSnackBar(context, message: 'weak-password',);
          }
          else if(state.error.code=='email-already-in-use'){
            showSnackBar(context, message: 'email-already-in-use',);
          }
          else{
            showSnackBar(context,message: state.error.code.toString());
          }
          BlocProvider.of<AuthCubit>(context).changeLoad(load: false);
        }

    },
      builder:(context,state)=> ModalProgressHUD(
        inAsyncCall: BlocProvider.of<AuthCubit>(context).isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: RegisterBody(cubit:cubit),
        ),
      ),
    );
  }
}
