 import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/auth/manager/auth_cubit.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatelessWidget {
    LoginBody({super.key, required this.cubit});
  final AuthCubit cubit;
  final formKey = GlobalKey<FormState>();
    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
        key: formKey,
        child: ListView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            verticalHeight(75),
            Image.asset(
              kLogo,
              height: 100,
            ),
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
            verticalHeight(75),
            const Row(
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            verticalHeight(20),
            CustomTextFormField(
              hintText: 'email',
              onChanged: (data) {
                cubit.email = data;
              },
              validator: (data) {
                if (data.isEmpty) {
                  return 'this field is required';
                }
                return null;
              },
            ),
            verticalHeight(20),
            CustomTextFormField(
              hintText: 'password',
              obscureText: true,
              onChanged: (data) {
                cubit.password = data;
              },
              validator: (data) {
                if (data.isEmpty) {
                  return 'this field is required';
                }
                return null;
              },
            ),
            verticalHeight(20),
            CustomButton(
              onTab: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context)
                      .changeLoad(load: true);

                  BlocProvider.of<AuthCubit>(context).login(
                    email: cubit.email!,
                    password: cubit.password!,
                  );
                }
              },
              label: 'LOGIN',
            ),
            verticalHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'don\'t have an account ?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'RegisterPage');
                  },
                  child: const Text(
                    '   Register ',
                    style: TextStyle(
                      color: Color(0xffBED4DB),
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

    SizedBox verticalHeight(double height) {
      return SizedBox(
            height: height,
          );
    }
}
