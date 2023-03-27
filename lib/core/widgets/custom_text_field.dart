import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.label,
      this.suffixIcon,
      required this.prefixIcon,
      required this.validation,
      this.onTap,
      required this.obscure})
      : super(key: key);

  final TextEditingController controller;

  final String label;

  final Icon? suffixIcon;

  final Icon prefixIcon;

  final VoidCallback? onTap;

  final dynamic validation;

  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        validator: (value) {
          return validation(value);
        },
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
          prefixIcon: prefixIcon,
          suffixIcon: GestureDetector(onTap: onTap, child: suffixIcon),
        ),
      ),
    );
  }
}
