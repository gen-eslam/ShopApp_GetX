import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;

  final TextInputType type;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  const AuthTextFormField({
    required this.controller,
    required this.obscureText,
    required this.type,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,

      keyboardType: type,

      validator: (value) => validator(value),
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorStyle: TextStyle(
          color: Get.isDarkMode? Colors.white:Colors.black,
        ),


        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
