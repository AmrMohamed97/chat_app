import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/auth/manager/auth_cubit.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
    RegisterBody({super.key, required this.cubit});
    final AuthCubit cubit;
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 75,
            ),
            Image.asset(kLogo,height: 100,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Pacifico-Regular',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 75,
            ),
            const Row(
              children: [
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: 'email',
              onChanged: (data){
                cubit.email=data;
              },
              validator: (data){
                if(data.isEmpty){
                  return'this field is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: 'password',
              obscureText: true,
              onChanged: (data){
                cubit.password=data;
              },
              validator: (data){
                if(data.isEmpty){
                  return'this field is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTab: (){
                if (formKey.currentState!.validate()){
                  BlocProvider.of<AuthCubit>(context).changeLoad(load: true);
                  BlocProvider.of<AuthCubit>(context).register(email: cubit.email!, password: cubit.password!);
                }
              },
              label: 'REGISTER',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have an account ?',
                  style: TextStyle(
                    color:Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '   Login ',
                    style: TextStyle(
                      color:Color(0xffBED4DB),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
