import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.contentPadding,
    required this.height,
    required this.width,
    required this.obscure,
    this.keyboard = TextInputType.name,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  final String hintText;
  final double height;
  final double width;
  final TextEditingController controller;
  final EdgeInsetsGeometry contentPadding;
  final bool obscure;
  final TextInputType keyboard;
  final Widget prefixIcon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: color.secondary, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 18,
                color: color.tertiary,
                fontWeight: FontWeight.w400),
          ),
          obscureText: obscure,
          keyboardType: keyboard,
        ),
      ),
    );
  }
}
