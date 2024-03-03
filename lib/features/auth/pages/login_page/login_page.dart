import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/widgets/show_snack_bar.dart';
import 'package:chat_app/features/auth/manager/auth_cubit.dart';
import 'package:chat_app/features/auth/manager/auth_state.dart';
import 'package:chat_app/features/auth/pages/login_page/widget/login_body.dart';
import 'package:chat_app/features/chat_page/pages/chat_page.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String id = 'LoginPage';
  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is LoginSuccess) {
        Navigator.pushNamed(context, ChatPage.id, arguments: cubit.email);
        showSnackBar(context, message: 'Login Success');
        BlocProvider.of<AuthCubit>(context).changeLoad(load: false);
      }
      if (state is LoginError) {
        if (state.error.code == 'wrong-password') {
          showSnackBar(context, message: 'enter correct Password');
        } else if (state.error.code == 'user-not-found') {
          showSnackBar(context, message: 'enter correct email');
        } else if (state.error.code == 'invalid-credential') {
          showSnackBar(context,
              message: 'you entered invalid email or password .');
        } else {
          showSnackBar(context, message: state.error.code.toString());
        }
        BlocProvider.of<AuthCubit>(context).changeLoad(load: false);
      }
    },
        builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: BlocProvider.of<AuthCubit>(context).isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body:LoginBody(cubit:cubit) ,
        ),
      );
    });
  }
}
