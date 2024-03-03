 import 'package:chat_app/core/widgets/custom_bloc_observer.dart';
import 'package:chat_app/features/auth/manager/auth_cubit.dart';
import 'package:chat_app/features/auth/pages/login_page/login_page.dart';
import 'package:chat_app/features/auth/pages/register_page/register_page.dart';
 import 'package:chat_app/features/chat_page/pages/chat_page.dart';
import 'package:chat_app/features/chat_page/manager/chat_cubit.dart';
import 'package:chat_app/firebase_options.dart';
  import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer=CustomBlocObserver();
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>AuthCubit()),
         BlocProvider(create: (context)=>ChatCubit()..getMessages(),),
      ] ,
      child: MaterialApp(
           routes: {
            LoginPage.id: (context)=>const LoginPage(),
            RegisterPage.id: (context)=>const RegisterPage(),
            ChatPage.id: (context)=>ChatPage(),
          },
          debugShowCheckedModeBanner: false,
          initialRoute: LoginPage.id,
        ),
    );
  }
}
