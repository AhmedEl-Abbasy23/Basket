import 'package:flutter/material.dart';

Widget defaultTFF({
  required TextEditingController controller,
  required Function(String) validate,
  required String label,
  required IconData prefix,
  Function? onSubmit,
  onSuffixPressed,
  IconData? suffix,
  bool isObscure = false,
  TextInputType inputType = TextInputType.text,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: (value) => validate(value!),
      onFieldSubmitted: (value) => onSubmit!(value),
      obscureText: isObscure,
      cursorColor: Colors.black,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          letterSpacing: 1.0,
        ),
        fillColor: Colors.white,
        focusColor: Colors.white,
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: onSuffixPressed,
                icon: Icon(suffix, color: Colors.black),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
        ),
      ),
    );
