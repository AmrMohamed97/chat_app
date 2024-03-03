import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,this.onChanged ,this.hintText,this.validator, this.obscureText=false}):super(key: key);
  final String? hintText;
  final Function(String)? onChanged;
  final FormFieldValidator? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      obscureText:obscureText ,
    );
  }
}
