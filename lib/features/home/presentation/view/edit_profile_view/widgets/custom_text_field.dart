import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.controller,
      this.isItPassword = false,
      this.obscured = false,
      this.validator,
      this.type = TextInputType.text})
      : super(key: key);
  final String label;
  final TextEditingController controller;
  final bool isItPassword;
  final bool obscured;
  final Function(dynamic value)? validator;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator!(value),
      controller: controller,
      obscureText: obscured,
      cursorHeight: 25,
      keyboardType: type,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      autofocus: false,
      cursorColor: kMainColor,
      style: const TextStyle(color: Colors.black, height: 1.2),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kMainColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hoverColor: kMainColor,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[500], height: 0.4),
      ),
    );
  }
}
